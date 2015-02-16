class Api::ApplicationController < ApplicationController
  protect_from_forgery

  skip_before_filter  :verify_authenticity_token
  before_filter :require_json

  respond_to :json

  wrap_parameters false

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # rescue_from CanCan::AccessDenied, with: :access_denied

  protected

  def expand?(association)
    params[:expand].present? && params[:expand].split(',').include?(association)
  end

  private

  def require_json
    if (env['CONTENT_TYPE'].present? && !env['CONTENT_TYPE'].include?('application/json')) && ['POST', 'PATCH', 'DELETE'].include?(env['REQUEST_METHOD'])
      render json: { message: 'Body should be a JSON Hash' }, status: :bad_request
    end
  end

  def record_not_found(error)
    render json: { message: error.message }, status: :not_found
  end

  def access_denied(error)
    render json: { message: error.message }, status: :forbidden
  end
end
