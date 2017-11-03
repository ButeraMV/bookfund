class Ebook < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :body, presence: true
  validates :price, presence: true
  validates :published, inclusion: { in: [ true, false ] }

  has_many :order_ebooks
  has_many :orders, through: :order_ebooks
  has_many :user_ebooks
  has_many :users, through: :ebooks
  has_many :ebook_categories
  has_many :categories, through: :ebook_categories
  belongs_to :author, optional: true
end
