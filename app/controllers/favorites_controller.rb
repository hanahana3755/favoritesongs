class FavoritesController < ApplicationController
  before_action :set_song

  def create
    @favorite = current_user.favorites.find_or_initialize_by(song: @song)
    if @favorite.new_record? && @favorite.save
      redirect_to @song, notice: 'いいねしました。'
    else
      redirect_to @song, alert: 'すでにいいねしています。'
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(song: @song)
    @favorite.destroy if @favorite
    redirect_to @song, notice: 'いいねを取り消しました。'
  end

  private

  def set_song
    @song = Song.find(params[:song_id])
  end
end
