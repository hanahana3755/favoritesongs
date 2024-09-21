class UsersController < ApplicationController
  def index
    @song=Song.new
    @user=current_user
    @users=User.all
  end

  def show
    @song=Song.new
    @user=User.find(params[:id])
    @songs=@user.songs.all
  end

  def edit
    @user=User.find(params[:id])
  end
  
  def update
    user=User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
