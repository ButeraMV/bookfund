class EbooksController < ApplicationController
  def index
    @ebooks = Ebook.paginate(:page => params[:page], :per_page => 20)
    @cart = Cart.new(session[:cart])
  end

  def show
    @ebook = Ebook.find(params['id'])
  end
end