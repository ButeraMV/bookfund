class EbooksController < ApplicationController
  def index
    @ebooks = Ebook.paginate(:page => params[:page], :per_page => 20)
    @cart = Cart.new(session[:cart])
  end

  def show
    @ebook = Ebook.find(params['id'])
  end

  def new
    @author = Author.find(params[:author])
    @ebook = Ebook.new(author: @author)
  end

  def create
    ebook = Ebook.new(title: params['title'],
                      description: params['description'],
                      body: params['body'],
                      price: params['price'],
                      author_id: params['author_id'])
    if ebook.save
      flash[:success] = "eBook created"
      redirect_to users_authors_ebook_path(ebook)
    else
      flash[:failure] = "eBook was not created"
      redirect_to users_authors_path
    end
  end
end