class Gurunabi
  def self.fetch_gurunabi_api(private_room, card, lunch)
    # ぐるなびapiの情報取得
    gurunabi_api = Rails.application.config.gurunabi_url + "&private_room=#{private_room}&card=#{card}&lunch=#{lunch}"
    uri_encode = URI.encode(gurunabi_api)
    uri = URI.parse(uri_encode)
    begin
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.open_timeout = 5
        http.read_timeout = 10
        http.get(uri.request_uri)
      end

      case response
        when Net::HTTPSuccess
          json = JSON.parse(response.body)
          if json['results_returned'] == 0
            nil
          else
            json
          end
        else
          Rails.logger.debug(uri.to_s)
      end

    rescue => e
      Rails.logger.debug(e.message)
    end
  end
end
