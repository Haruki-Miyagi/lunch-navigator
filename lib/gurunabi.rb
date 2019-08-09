require 'net/https'

class Gurunabi
  def self.fetch_gurunabi_api(**kwargs)
    # ぐるなびapiの情報取得
    gurunabi_api = "#{Rails.application.config.gurunabi_url}&#{kwargs.to_param}"
    uri_encode = URI.encode(gurunabi_api)
    uri = URI.parse(uri_encode)
    json = Net::HTTP.get(uri)
    JSON.parse(json)
  end
end
