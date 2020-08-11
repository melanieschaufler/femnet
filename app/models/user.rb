class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_interest
  has_many :interests, through: :user_interest, dependent: :destroy

  has_many :requests_as_asker, source: :request, foreign_key: :asker_id
  has_many :requests_as_receiver, source: :request, foreign_key: :receiver_id

  validates :age, inclusion: 16..99
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :answer1, :answer2, :answer3, length: { in: 100..500 }
end
