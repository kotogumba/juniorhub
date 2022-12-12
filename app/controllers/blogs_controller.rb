class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = policy_scope(Blog)
  end

  def show
  end

  def new
    @blog = Blog.new
    authorize @blog
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    authorize @blog
    if params[:blog][:tags].present?
      params[:blog][:tags].each do |tag|
        @blog.tags << Tag.find(tag)
      end
    end
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @blog.update(blog_params)
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, status: :see_other
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
    authorize @blog
  end

  def blog_params
    params.require(:blog).permit(:title)
  end
end
