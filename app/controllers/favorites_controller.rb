class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'Micropostをファボりました。'
    redirect_back(fallback_location: root_path) 
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'Micropostをファボから消しました。'
    redirect_back(fallback_location: root_path)
  end
end
