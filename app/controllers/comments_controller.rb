class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  def index
    @comments = policy_scope(Comment)
  end

  def show
  end

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to comment_path(@comment)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
    redirect_to comments_path, status: :see_other
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
