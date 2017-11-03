class OrderEbook < ApplicationRecord
  belongs_to :ebook
  belongs_to :order
end
