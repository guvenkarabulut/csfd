class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[destroy update]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Comment was created successfully'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Comment has not been created'
      render 'new'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      flash[:notice] = 'Comment was deleted successfully'
      redirect_to post_path(@post)
    else
      flash[:alert] = "You can't delete this comment"
      redirect_to post_path(@post)
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comments_params)
        format.html { redirect_to post_url(@post), notice: 'Comment was successfully updated.' }
      else
        format.html { redirect_to post_url(@post), notice: 'Comment was not updated.' }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end
end
