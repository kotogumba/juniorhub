class JobResponse < ApplicationRecord
  validates :user_id, :job_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one_attached :cv
  validates :cv, presence: true
  enum status: [ :draft, :pending, :accepted, :declined ]
  belongs_to :user
  belongs_to :job
end
