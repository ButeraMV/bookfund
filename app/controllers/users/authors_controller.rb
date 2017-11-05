class Users::AuthorsController < ApplicationController
  def index
    @authors = Author.where(user_id: current_user.id)
  end

  def create
    user = User.find(current_user.id)
    author = Author.new(name: params['name'], user: user)
    if author.save
      user.authors << author
      flash[:success] = "Author created"
      redirect_to users_authors_path
    else
      flash[:failure] = "Author was not created"
      redirect_to users_authors_path
    end
  end
end
