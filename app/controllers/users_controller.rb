class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to users_path, notice: "Signed up!"
    else
      render "new"
    end
  end
  
  def update
    @user = User.find(params[:id])
    flash[:notice] = "Profile Updated!"
    if @user.update(params[:user].permit(:name, :nickname, :email, :password, :password_confirmation))
      redirect_to sessions_path
    else 
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    redirect_to users_path
  end
 private
  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
  end
end
