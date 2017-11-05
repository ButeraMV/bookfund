class Users::Authors::EbooksController < ApplicationController
  def show
    @ebook = Ebook.find(params[:id])
  end
end
