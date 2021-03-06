class EbooksController < ApplicationController
  def index
    @ebooks = Ebook.paginate(:page => params[:page], :per_page => 8)
    @cart = Cart.new(session[:cart])
  end

  def show
    @ebook = Ebook.find(params['id'])
    @categories = @ebook.categories
  end

  def backing
    @ebook = Ebook.find(params['id'])
  end
end