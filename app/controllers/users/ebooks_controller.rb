class Users::EbooksController < ApplicationController
  def show
    @ebook = current_user.ebooks.find(params[:id])
  end
end
