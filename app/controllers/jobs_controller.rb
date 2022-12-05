class JobsController < ApplicationController
  validates :title, :description, :location, presence: true
  def show
    @job = Job.find(params[:id])
  end
end
