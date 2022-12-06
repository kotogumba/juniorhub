class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :job_responses
  has_many :jobs, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :private_chatrooms_as_sender, class_name: "PrivateChatroom", foreign_key: "user_sender_id"
  has_many :private_chatrooms_as_reciever, class_name: "PrivateChatroom", foreign_key: "user_reciever_id"
  before_create :build_profile

  def find_private_chat(user)
    PrivateChatroom.find_by(user_sender: user, user_reciever: self) || PrivateChatroom.find_by(user_sender: self, user_reciever: user)
  end
end
