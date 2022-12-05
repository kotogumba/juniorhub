class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :job_responses
  has_many :jobs, dependent: :destroy
  has_one :profile, dependent: :destroy
  before_create :build_profile
end
