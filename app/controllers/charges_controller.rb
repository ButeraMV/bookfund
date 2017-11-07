class ChargesController < ApplicationController
  def new
  end

  def create
    @amount = @cart.cart_total_stripe
    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount,
                                      description: 'Rails Stripe customer')

    order = Order.create(status: 0, user_id: current_user.id, total_price: @cart.cart_total)
		item_hash = @cart.order_hash
		order.add(item_hash)
		@cart.destroy
    rescue Stripe::CardError => e
      flash[:error] = e.message

    redirect_to new_orders_path(current_user)
  end
end
