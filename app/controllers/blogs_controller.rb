class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = policy_scope(Blog)
    @categories = Category.all
    @blog_posts = BlogPost.all
    if params[:query].present?
      @query = params[:query]
      @blog_posts = BlogPost.search_by_title(@query)
    else
      @blog_posts = @blog_posts.where(blog: @blog)
      @blog_posts = BlogPost.all
    end
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
    if params[:blog][:categories].present?
      params[:blog][:categories].each do |category|
        @blog.categories << Category.find(category)
      end
    end
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    redirect_to blog_path(@blog)
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
    params.require(:blog).permit(:title, :image)
  end
end
