class PostsController < ApplicationController
  include ApplicationHelper
  before_action :set_post, only: %i[show update destroy]
  before_action :authenticate_user_role_is_admin!, except: %i[index show]
  before_action :set_post_with_author, only: %i[edit]
  # GET /posts or /posts.json
  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments = @post.comments.paginate(page: params[:page], per_page: 4).order('created_at DESC')
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_post_with_author
    @post = Post.find(params[:id])
    return if current_user.present? && (current_user.role == 'admin' || current_user.id == @post.user_id)

    flash[:alert] = 'You are not authorized to access this page.'
    redirect_to root_path
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image, :summary, :tag)
  end
end
