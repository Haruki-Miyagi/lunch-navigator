class ShopsController < ApplicationController
  def index
    response = Gurunabi.fetch_gurunabi_api(
      private_room: 1,
      card: 1,
      lunch: 1,
      latitude: 26.212576,
      longitude: 127.679021,
      # 緯度/経度からの検索範囲(半径) 1:300m,2:500m,3:1000m,4:2000m,5=3000m
      range: 5,
    )

    @resouces = response['rest']
  end
end
