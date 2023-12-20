class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
    username == ENV["BASIC_AUTH_USER3"] && password == ENV["BASIC_AUTH_PASSWORD3"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduce])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :introduce])
  end

end
