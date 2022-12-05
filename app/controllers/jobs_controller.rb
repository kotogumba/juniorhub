class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = policy_scope(Job)
  end

  def show
  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    authorize @job
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, status: :see_other
  end

  private

  def set_job
    @job = Job.find(params[:id])
    authorize @job
  end

  def job_params
    params.require(:job).permit(:title, :location, :content)
  end
end
