class VotesController < ApplicationController

  def new
    @vote = Vote.new
    authorize @vote
  end

  def create
    @vote = Vote.new
    @vote.user = current_user
    @vote.blog_post = BlogPost.find(params[:blog_post_id])
    authorize @vote
    if @vote.save
      redirect_to blog_blog_post_path(@vote.blog_post.blog, @vote.blog_post), notice: "You voted!"
    else
      redirect_to blog_blog_post_path(@vote.blog_post.blog, @vote.blog_post), alert: "Error!"
    end
  end

  def update
    @vote = Vote.find(params[:id])
    authorize @vote
    @vote.value = params[:value]
    @vote.save
    redirect_to blog_blog_post_path(@vote.blog_post.blog, @vote.blog_post), notice: "Your vote changed!"
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to blog_blog_post_path(@vote.blog_post.blog, @vote.blog_post)
  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end

end
