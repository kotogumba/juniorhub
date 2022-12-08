class JobResponsesController < ApplicationController
  before_action :set_job, only: [:new, :create]

  def new
    @job_response = JobResponse.new
    authorize @job_response
  end

  def create
    @job_response = JobResponse.new(job_response_params)
    @job_response.job = @job
    @job_response.user = current_user
    authorize @job_response

    if @job_response.save
      redirect_to "/dashboard", status: :see_other
    else
      flash[:alert] = "You did not fill all the required fields of your application"
      redirect_to new_job_job_response_path(@job)
    end
  end

  def update
    @job_response = JobResponse.find(params[:id])
    authorize @job_response
    if params[:status] == "accepted"
      @job_response.accepted!
    elsif params[:status] == "declined"
      @job_response.declined!
    end
    @job_response.save
    NotificationsChannel.broadcast_to(@job_response.user, render_to_string(partial: "notification"))
    redirect_to "/dashboard", status: :see_other
  end

  private

  def set_job
    @job = Job.find(params[:job_id])
  end

  def job_response_params
    params.require(:job_response).permit(:first_name, :last_name, :cv, :status)
  end
end
