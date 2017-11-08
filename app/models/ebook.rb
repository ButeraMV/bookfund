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

  def self.add_to_funding(ebook)
    if ebook.funding != nil
      current_funding = ebook.funding
      ebook.update(funding: (current_funding + 10))
    else
      ebook.update(funding: 10)
    end
  end

  def percent_funded
    (self.funding.to_f / 200) * 100
  end
end
