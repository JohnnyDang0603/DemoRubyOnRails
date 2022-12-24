class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters,
                if: :devise_controller?

  def check_authorize(record, query = nil)
    authorize(record, query, policy_class: "#{controller_path.classify}Policy".constantize)
  end

  private

  def not_authorized
    redirect_to root_path, notice: 'You are not authorized to perform this action.'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

end
