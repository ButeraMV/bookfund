class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      not_found
    end
  end
end