class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_interests
  has_many :interests, through: :user_interest, dependent: :destroy

  has_many :requests_as_asker, source: :request, foreign_key: :asker_id
  has_many :requests_as_receiver, source: :request, foreign_key: :receiver_id

  has_one_attached :photo
  has_one_attached :resume
end
