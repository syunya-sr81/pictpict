class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    favorite.save
    redirect_to topics_path, success: 'お気に入りに登録しました'
    
  end
    
  def destroy
    @favorite = Favorite.find_by(topic_id: params[:topic_id], user_id: current_user.id)
    @favorite.destroy
    redirect_to topics_path, success: 'お気に入りを削除しました'
  end
end
