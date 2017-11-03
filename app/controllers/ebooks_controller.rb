class EbooksController < ApplicationController
  def index
    @ebooks = Ebook.paginate(:page => params[:page], :per_page => 20)
    @cart = Cart.new(session[:cart])
  end
end