class ShopsController < ApplicationController
  def index
    response = Lunchmap.fetch(
      private_room: params[:private_room],
      card: params[:card],
      lunch: params[:lunch],
      latitude: params[:latitude].present? ? params[:latitude] : 26.212576,
      longitude: params[:longitude].present? ? params[:longitude] : 127.679021,
      # 緯度/経度からの検索範囲(半径) 1:300m,2:500m,3:1000m,4:2000m,5=3000m
      range: 5,
    )

    @resouces = response['rest']
    @errors = response['error']
  end
end
