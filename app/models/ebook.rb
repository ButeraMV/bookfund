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
  belongs_to :author


  def short_description
    if description.length > 140
      description[0..139] + "..."
    else
      description
    end
  end

  def self.top_books
    query = find_by_sql('select ebooks.title, count(order_ebooks.order_id) as order_count from ebooks join order_ebooks on ebooks.id = order_ebooks.ebook_id group by ebooks.title order by order_count desc limit 10')
    query.map do |result|
      result.title
    end
  end
end
