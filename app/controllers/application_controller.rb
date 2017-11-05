class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :not_found
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
end
