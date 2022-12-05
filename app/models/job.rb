class Job < ApplicationRecord
  belongs_to :user
  has_many :job_responses, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
end
