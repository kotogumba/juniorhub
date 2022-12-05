class Job < ApplicationRecord
  validates :title, :content, :location, presence: true
  belongs_to :user
  has_many :job_responses, dependent: :destroy
  validates :title, :content, :location, presence: true
end
