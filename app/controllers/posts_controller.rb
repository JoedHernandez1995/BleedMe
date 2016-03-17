class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @profiles = Profile.all
    @users = User.all
  end

  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.user_name = current_user.username
    @post.user_email = current_user.email
    if @post.save
      flash[:success] = "Post was sucessfully created"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post was successfully updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @post.destroy
    flash[:danger] = "Post was successfully deleted"
    redirect_to profile_path
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body)
    end
end
