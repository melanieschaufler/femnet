class Request < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_one :chatroom, dependent: :destroy

  validates :asker, uniqueness: { scope: :receiver }
end
