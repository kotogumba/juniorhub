class PrivateChatroom < ApplicationRecord
  belongs_to :user_sender, class_name: "User"
  belongs_to :user_reciever, class_name: "User"
  has_many :private_messages, dependent: :destroy
end
