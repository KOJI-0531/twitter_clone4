class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(login_user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to("/users/index")
    end
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.update(update_user_params)
    @user.save
    redirect_to("/users/index")
  end
  
  def create
    @user = User.new(create_user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to("/users/index")
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to("/users/index")
  end
  
  def logout
    session[:user_id] = nil
    redirect_to("/users/index")
  end
  
  private
  
  def login_user_params
    params.require(:user).permit(:name, :email, :passsword)
  end
  
  def update_user_params
    params.require(:user).permit(:email)
  end
  
  def create_user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end
