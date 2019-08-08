require 'net/https'

class Gurunabi
  def self.fetch_gurunabi_api(private_room, card, lunch)
    # ぐるなびapiの情報取得
    gurunabi_api = Rails.application.config.gurunabi_url + "&private_room=#{private_room}&card=#{card}&lunch=#{lunch}"
    uri_encode = URI.encode(gurunabi_api)
    uri = URI.parse(uri_encode)
    json = Net::HTTP.get(uri)
    JSON.parse(json)
  end
end
