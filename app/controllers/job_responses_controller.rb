class JobResponsesController < ApplicationController
  before_action :set_job, only: [:new, :create]

  def new
    @job_response = JobResponse.new
    authorize @job_response
  end

  def create
    @job_response = JobResponse.new
    @job_response.job = @job
    @job_response.user = current_user
    authorize @job_response
  end

  private

  def set_job
    @job = Job.find(params[:job_id])
  end

  def job_response_params
    params.require(:job_response).permit(:current_user.first_name)
  end
end
