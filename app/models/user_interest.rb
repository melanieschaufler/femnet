class UserInterest < ApplicationRecord
  belongs_to :user
  belongs_to :interest

  validates :score, presence: true
  validates :user_id, presence: true
  validates :interest_id, presence: true

  validates :user_id, uniqueness: { scope: :interest_id }
end
