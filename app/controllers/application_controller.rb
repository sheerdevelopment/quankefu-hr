class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_endings, if: :user_signed_in?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  SIGNUP_ATTRS = %i(first_name last_name avatar email password
                    password_confirmation remember_me address)
  UPDATE_ATTRS = %i(first_name last_name avatar password password_confirmation
                    current_password address)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: SIGNUP_ATTRS)
    devise_parameter_sanitizer.permit(:account_update, keys: UPDATE_ATTRS)
  end

  def set_endings
    @endings = (current_user.tenancies.endings + current_user.certificates.endings)
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = "Your action is not permitted to that record."
    redirect_to(request.referrer || root_path)
  end
end
