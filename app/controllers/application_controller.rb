class ApplicationController < ActionController::API
  
  class UnauthorizedError < StandardError; end
  
  rescue_from UnauthorizedError, with: ->() { render_unauthorized 'Unauthorized' }
  
  def render_unauthorized(message)
    render json: { errors: message }, status: 401, head: 'Unauthorized'
  end
  
  def load_current_user
    auth_token = request.headers['X-Cookbook-Auth']
    @authentication = Authentication.find_by(auth_token: auth_token) if auth_token.present?
    @current_user = @authentication.try(:user)
    raise UnauthorizedError unless @current_user
  end
  
  def render_errors(object)
    render json: { errors: object.errors.messages, fields: object.errors.keys }, status: :unprocessable_entity, head: :unprocessable_entity
  end
  
  def not_found
    render json: { errors: "Record not found" }, status: :not_found, head: :not_found
  end
    
end
