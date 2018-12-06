class Survey < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :questions, dependent: :destroy, inverse_of: :survey
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
