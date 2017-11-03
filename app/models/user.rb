class User < ApplicationRecord
  has_secure_password
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :orders
  has_many :user_ebooks
  has_many :ebooks, through: :user_ebooks
  has_many :authors

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
end
