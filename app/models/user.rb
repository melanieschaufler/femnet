class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :age, inclusion: 16..99
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :answer1, :answer2, :answer3, length: { in: 100..500 }

  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests, dependent: :destroy

  has_many :requests_as_asker, source: :requests, class_name: "Request", foreign_key: :asker, dependent: :destroy
  has_many :requests_as_receiver, source: :requests, class_name: "Request", foreign_key: :receiver_id, dependent: :destroy

  has_one_attached :photo
  has_one_attached :resume
end
