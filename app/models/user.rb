class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50}
  has_secure_password
  has_many :survey
end
