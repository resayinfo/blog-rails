class Api::SessionsController < Api::ApplicationController

  # POST /api/users/sign_in
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

    @user = User.find_by_email(email.downcase)

    # Check for existing user.
    if @user.nil?
      render json: { message: 'Bad credentials' }, status: :unauthorized
      return
    end

    # Check if password is a match.
    if not @user.valid_password?(password)
      render json: { message: 'Bad credentials' }, status: :unauthorized
      return
    end

    # Sign in the user.
    render json: @user.as_json.merge(authentication_token: @user.authentication_token), status: :created, location: [:api, @user]
  end

end
