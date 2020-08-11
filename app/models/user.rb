class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests, dependent: :destroy

  has_many :requests_as_asker, source: :requests, class_name: "Request", foreign_key: :asker, dependent: :destroy
  has_many :requests_as_receiver, source: :requests, class_name: "Request", foreign_key: :receiver_id, dependent: :destroy
end
