class CommentsController < ApplicationController
  before_action :set_post, only: [:index, :show, :new, :create, :update, :destroy]
  def index
    @post
  end

  def show
  end

  def new
    @comment = Comment.new(user_id: current_user)
  end

  def create
    @comment = current_user.comments.create(comment_params)
    @comment.user_id = current_user
    @comment.post_id = @post.id
    if @comment.save

      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  private

  def comment_params
     params.require(:comment).permit(:post_id, :user, :text, :id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
