class Author < ApplicationRecord
  belongs_to :user
  has_many :ebooks

  validates :name, presence: true
end
