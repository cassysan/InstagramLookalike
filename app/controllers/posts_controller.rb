class PostsController < ApplicationController
  before_action :post_params, :set_post, only: [:update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:error] = @post.errors.full_messages
      render 'new'
    end
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :photo)
  end
end
