class Category < ApplicationRecord
  has_many :ebook_categories
  has_many :ebooks, through: :ebook_categories

  validates :name, presence: true, uniqueness: true
end
