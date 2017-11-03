class Category < ApplicationRecord
  has_many :ebook_categories
  has_many :ebooks, through: :categories

  validates :name, presence: true, uniqueness: true
end
