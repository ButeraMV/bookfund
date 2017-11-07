class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :not_found
  helper_method :current_cart
  helper_method :current_admin?
  helper_method :require_admin
  before_action :set_cart

  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def not_found
    raise ActionController::RoutingError.new('404 - The page you are looking for does not exist')
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
