class Category < ApplicationRecord
  has_many :ebook_categories
  has_many :ebooks, through: :categories
end
