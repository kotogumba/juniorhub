class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  def index
    @blog = Blog.find(params[:blog_id])
    @blog_posts = policy_scope(BlogPost)
    @blog_posts = @blog_posts.where(blog: @blog)
  end

  def show
  end

  def new

    @blog = Blog.find(params[:blog_id])
    @blog_post = BlogPost.new
    authorize @blog_post
    authorize @blog

  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.blog = Blog.find(params[:blog_id])
    authorize @blog_post
    if params[:blog_post][:tags].present?
      params[:blog_post][:tags].each do |tag|
        @blog_post.tags << Tag.find(tag)
      end
    end
    if @blog_post.save
      redirect_to blog_path(@blog_post.blog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @blog_post.update(blog_post_params)
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_path, status: :see_other
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
    @blog = Blog.find(params[:blog_id])
    authorize @blog_post
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :content)
  end
end
