class Order < ApplicationRecord
  belongs_to :user

  has_many :order_ebooks
  has_many :ebooks, through: :order_ebooks

  validates :user_id, :total_price, :status, presence: true

  enum status: [:ordered, :paid, :cancelled, :completed]

  def add(ebook_hash)
    ebook_hash.each do |ebook, ebook_quantity|
      ebooks << ebook
      user.ebooks << ebook
      order_ebook = OrderEbook.find_by(ebook_id: ebook.id)
      order_ebooks.find_by(ebook_id: ebook.id).update(quantity: ebook_quantity)
      order_ebooks.find_by(ebook_id: ebook.id).update(line_item_total: (ebook.price * ebook_quantity))
    end
  end

  def self.ordered
    where(status: 0)
  end

  def self.paid
    where(status: 1)
  end

  def self.cancelled
    where(status: 2)
  end

  def self.completed
    where(status: 3)
  end

end
