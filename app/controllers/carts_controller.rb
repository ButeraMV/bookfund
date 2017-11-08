class CartsController < ApplicationController
  def create
    id = params[:ebook_id].to_s
    ebook = Ebook.find_by(id: id)
    @cart.add_item(ebook.id)
    session[:cart] = @cart.contents
    redirect_back(fallback_location: root_path)
    flash[:success] = "#{ebook.title} added to cart"
  end

  def show
    @cart = Cart.new(session[:cart])
    @ebooks = Ebook.find(@cart.contents.keys)
  end

  def destroy
    ebook = Ebook.find(params[:format])
    @cart.contents.delete(params[:format])
    flash[:success] = "Removed <a href=#{ebook_path(ebook)}>#{ebook.title}</a> from your cart."

    redirect_to cart_path
  end
end