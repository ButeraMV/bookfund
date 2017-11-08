class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :user_ebooks
  has_many :ebooks, through: :user_ebooks
  has_many :authors

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :role, presence: true

  enum role: ["user", "admin"]

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info['uid']
      new_user.email              = auth_info['extra']['raw_info']['screen_name']
      new_user.password           = auth_info['credentials']['token']
      new_user.token              = auth_info['credentials']['token']
      new_user.secret             = auth_info['credentials']['secret']
    end
  end
end
