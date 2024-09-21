class PostCommentsController < ApplicationController
  def create
    song = Song.find(params[:song_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.song_id = song.id
    comment.save
    redirect_to song_path(song)
  end

  def destroy
    post_comment = 
  post_comment =

    PostComment.find_by(id: params[:id])
    if post_comment
      post_comment.destroy
      redirect_to song_path(post_comment.song_id)
    else
      redirect_to songs_path
    end
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
