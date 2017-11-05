class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      not_found
    end
  end

  def new
		order = Order.create(status: 0, user_id: current_user.id, total_price: @cart.cart_total)
		item_hash = @cart.order_hash
		order.add(item_hash)
		@cart.destroy
		flash[:success] = "Order was successfully placed"
		redirect_to dashboard_path
	end
end