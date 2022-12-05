class JobsController < ApplicationController
  before_action :set_job, only: [:show]
  validates :title, :description, :location, presence: true
  def show
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end
end
