class Author < ApplicationRecord
  belongs_to :user, optional: true
  has_many :ebooks

  validates :name, presence: true
end
