class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  helper_method :current_admin?

  def current_admin?
    current_user.admin?
  end

  protected

  SIGNUP_ATTRS = %i(email password password_confirmation remember_me user_role_id)
  UPDATE_ATTRS = %i(password password_confirmation current_password user_role_id)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: SIGNUP_ATTRS)
    devise_parameter_sanitizer.permit(:account_update, keys: UPDATE_ATTRS)
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = "Your action is not permitted to that record."
    redirect_to(request.referrer || root_path)
  end
end
