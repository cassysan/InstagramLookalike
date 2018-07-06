class PostsController < ApplicationController
  before_action :post_params, :set_post, only: [:show, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
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
    @comments = Comment.all
    @comment = Comment.new

  end

  def profile
    @user = User.find(:id)
    @posts = Post.where(user_id === @user)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :photo, :photo_cache)
  end
end
