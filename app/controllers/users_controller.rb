class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
    @user = current_user
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
 
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to post_images_path
    end
  end
 
  
end
