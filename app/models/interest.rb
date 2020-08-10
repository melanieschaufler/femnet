class Interest < ApplicationRecord
  has_many :user_interests
  has_many :users, through: :user_interest
end
