class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @profiles = policy_scope(Profile)

    if params[:search].present?
      @profiles = @profiles.where("first_name ILIKE ?", "%#{params[:search]}%")
    end
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    authorize @profile
  end

  def edit
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def update
    @profile = Profile.find(params[:id])
    @user = @profile.user
    authorize @profile
    if @profile.update(user_params)
      redirect_to profile_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :bio, :phone_number, :address, :city, :state, :zip_code, :country, :linkedin_url, :github_url, :personal_website_url, :resume_url, :other_url)
  end
end
