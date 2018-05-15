class UsersController < ApplicationController 
  before_action :set_user, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if !@user.save
    	redirect_to '/users/new'
    else
    	session[:user_id] = @user.id
    	redirect_to '/'
    end
  end
  
  def show
    
  end

  private
 
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

 end