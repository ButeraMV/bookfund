class EbooksController < ApplicationController
  def index
    @ebooks = Ebook.paginate(:page => params[:page], :per_page => 20)
  end
end