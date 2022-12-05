class JobResponsesController < ApplicationController
  validates :user_id, :job_id, presence: true
end
