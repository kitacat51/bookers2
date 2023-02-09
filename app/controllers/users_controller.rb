class UsersController < ApplicationController
  def index
  end
  
  def show
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
