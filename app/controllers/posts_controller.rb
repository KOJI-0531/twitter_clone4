class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.update(update_post_params)
    @post.save
    redirect_to("/")
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(create_post_params)
    @post.save
    redirect_to("/")
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/")
  end
  
  private
  
  def update_post_params
    params.require(:post).permit(:content)
  end
  
  def create_post_params
    params.require(:post).permit(:content).merge(user_id: @current_user.id)
  end
  
end
