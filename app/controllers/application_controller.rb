class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Для выполнения данного действия необходимо авторизоваться."
    redirect_back(fallback_location: root_path)
  end
end
