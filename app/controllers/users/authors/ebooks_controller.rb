class Users::Authors::EbooksController < ApplicationController
  def show
    @ebook = Ebook.find(params[:id])
    @category_names = parse_categories(@ebook.categories)
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

  def edit
    @ebook = Ebook.find(params[:id])
    @categories = Category.all
  end

  def update
    @ebook = Ebook.find(params[:id])
    categories = Category.where(name: params[:categories])
    @ebook.categories << categories

    redirect_to users_authors_ebook_path(@ebook)
  end

  private

    def parse_categories(categories)
      names = []
      categories.each do |category|
        names << category.name
      end
      names
    end
end
