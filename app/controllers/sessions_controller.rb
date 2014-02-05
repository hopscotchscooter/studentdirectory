class SessionsController < ApplicationController
  def new
    @users = User.all
  end
  
  def index
    @users = User.all
  end
  
    def edit
    @user = User.find(params[:id])
    end
  
  def create 
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to sessions_path, notice: "Logged in!"
    else
       flash[:notice] = "Invalid e-mail or password."
       render "new"
    end
  end  
    def destroy 
      session[:user_id] = nil
      redirect_to users_path, notice: "Logged out!"
    end
end
