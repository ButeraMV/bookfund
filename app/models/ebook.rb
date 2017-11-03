class Ebook < ApplicationRecord
  has_many :order_ebooks
  has_many :orders, through: :order_ebooks
  has_many :user_ebooks
  has_many :users, through: :ebooks
  has_many :ebook_categories
  has_many :categories, through: :ebooks
end
