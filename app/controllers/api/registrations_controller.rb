class Api::RegistrationsController < Api::ApplicationController
  before_filter :authenticate_user_from_token!, except: [:create]
  before_filter :authenticate_user!, except: [:create]

  # POST /api/users
  def create
    errors = []

    email = params[:email]
    password = params[:password]

    # Check for missing fields.

    if email.blank?
      errors << { resource: 'User', field: 'email', code: 'missing_field' }
    end

    if password.blank?
      errors << { resource: 'User', field: 'password', code: 'missing_field' }
    end

    if email.blank? or password.blank?
      render json: {
        message: 'The request must contain the email and password.',
        errors: errors
      }, status: :unprocessable_entity
      return
    end

    # Check for a valid password.
    if password.length < 8
      render json: {
        message: 'Your password is too short. Please use at least 8 characters.',
        errors: errors
      }, status: :unprocessable_entity
      return
    end

    # Check for existing user.
    @user = User.find_by_email(email.downcase)
    if @user.present?
      render json: {
        message: 'That email has already been taken.',
        errors: [ { resource: 'User', field: 'email', code: 'already_exists' } ]
      }, status: :unprocessable_entity
      return
    end

    # Attempt to create the user.
    @user = User.new(sign_up_params)
    begin
      if @user.save
        render json: @user.as_json.merge(authentication_token: @user.authentication_token), status: :created, location: [:api, @user]
      else
        message = 'We were unable to register you at this time. Please try again.'
        if @user.errors[:name].any? && @user.name.present?
          message = 'That name has already been taken. Please try again.'
        end
        render json: {
          message: message,
          errors: @user.errors
        }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotUnique
      render json: {
        message: 'That name has already been taken.',
        errors: [ { resource: 'User', field: 'name', code: 'already_exists' } ]
      }, status: :unprocessable_entity
    end
  end

  # PATCH /api/users
  def update
    @user = current_user

    if @user.update_attributes(account_update_params)
      head :no_content
    else
      message = 'We were unable to update your profile. Please try again.'
      render json: {
        message: message,
        errors: @user.errors
      }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.permit(:email, :password, :first_name, :last_name)
  end

  def account_update_params
    params.permit(:email, :password, :first_name, :last_name)
  end

end
