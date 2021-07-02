class MapsController < ApplicationController
  def index
    # このあとで@mapに関するフォームを作るので、Mapインスタンスを作っておきます(でないとエラーになる)
    @map = current_user.maps.new
    @maps = Map.all
    @feeds_map = Map.where(user_id: [*current_user.following_ids]).order(created_at: :desc)
    @my_map = Map.where(user_id: current_user.id).order(created_at: :desc)
  end

  def create
    @map = current_user.maps.new(map_params)
    if @map.save
      redirect_to maps_url
    else
      @maps = Map.all
      render 'maps/index'
    end
  end
  def show
    @map = Map.find(params[:id])
  end

  private

  # ストロングパラメーター
  def map_params
    params.require(:map).permit(:address, :latitude, :longitude, :title, :comment)
  end
end
