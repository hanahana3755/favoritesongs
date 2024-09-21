class SongsController < ApplicationController
  
  before_action :set_song, only: [:show, :favorites, :edit, :update, :destroy]
  before_action :authorize_user, only: [:favorites]
  
  def create
    @song=Song.new(song_params)
    @song.user_id=current_user.id
    @song.save
    redirect_to song_path(@song.id)

  end

  def index
    @user=current_user
    @song=Song.new
    @songs=Song.all
  end

  def show
    @song=Song.new
    @song2=Song.find(params[:id])
    @user=@song2.user
    @post_comment = PostComment.new
  end

  def edit
    @song=Song.find(params[:id])
    if @song.user_id==current_user.id
       render :edit
    else
       redirect_to songs_path
    end
  end
  
  def update
    @song=Song.find(params[:id])
    @song.update(song_params)
    redirect_to song_path(@song.id)
  end

  def destroy
    song=Song.find(params[:id])
    song.destroy
    redirect_to songs_path
  end
  
  def favorites
  @song = Song.find(params[:id])
  @favorited_users = @song.favorited_by_users
  end

private
  def song_params
    params.require(:song).permit(:song_name, :opinion)
  end
  
  def set_song
    @song = Song.find(params[:id])
  end

  def authorize_user
    redirect_to @song, alert: '権限がありません。' unless @song.user == current_user
  end
  
end
