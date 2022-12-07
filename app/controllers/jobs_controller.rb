class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = policy_scope(Job)
    if params[:query].present?
      @query = params[:query]
      @jobs = Job.search_by_title_content_location(params[:query])
    else
      @jobs = Job.all
      @jobs = tagged_jobs(@jobs) if params[:tag_id]
    end

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
    @job.update(job_params)

    respond_to do |format|
      format.html { redirect_to job_path(@job) }
      # format.text { render "jobs/show", locals: {job: @job}, formats: [:html] }
    end
    # if @job.update(job_params)
    #   redirect_to job_path(@job)
    # else
    #   render :edit
    # end
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

  def tagged_jobs(jobs)
    jobs.joins(:job_tags)
        .joins(:tags)
        .where('tags.id = ?', params[:tag_id])
  end
end
