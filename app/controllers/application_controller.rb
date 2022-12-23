class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  protect_from_forgery with: :exception
  def check_authorize(record, query = nil)
    authorize(record, query, policy_class: "#{controller_path.classify}Policy".constantize)
  end

  private

  def not_authorized
    redirect_to root_path, notice: 'You are not authorized to perform this action.'
  end
end
