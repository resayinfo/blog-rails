class Api::PasswordsController < Api::ApplicationController

  # POST /api/users/password
  def create
    errors = []

    email = params[:email]

    # Check for missing fields.
    if email.blank?
      errors << { resource: 'User', field: 'email', code: 'missing_field' }
      render json: {
        message: 'The request must contain the email.',
        errors: errors
      }, status: :unprocessable_entity
      return
    end

    @user = User.find_by_email(email.downcase)

    # Check for existing user.
    if @user.nil?
      render json: {
        message: 'A user with that email does not exist.',
        errors: [ { resource: 'User', field: 'email', code: 'invalid' } ]
      }, status: :unprocessable_entity
      return
    end

    # Send password reset instructions.
    @user.send_reset_password_instructions()
    render json: { :message => 'You will receive an email with instructions about how to reset your password in a few minutes.' }, location: [:api, @user]
  end

end
