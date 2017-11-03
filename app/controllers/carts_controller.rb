class CartsController < ApplicationController
  def create
    id = params[:ebook_id].to_s
    movie = Ebook.find_by(id: id)
    session[:cart] ||= {}
    session[:cart][id] = (session[:cart][id] || 0) + 1
    redirect_to ebooks_path
  end

  def show
    @cart = Cart.new(session[:cart])
    @ebooks = Ebook.find(@cart.contents.keys)
  end
end