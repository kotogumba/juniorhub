class JobResponse < ApplicationRecord
  validates :user_id, :job_id, presence: true
  enum :status, { draft: 0, accepted: 1, declined: 2 }
  belongs_to :user
  belongs_to :job
end
