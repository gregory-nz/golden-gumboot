class User < ApplicationRecord
  before_save { self.username = username.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  has_secure_password
  has_many :surveys, dependent: :destroy
end
