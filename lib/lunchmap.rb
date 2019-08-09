class Lunchmap
  def self.fetch(**kwargs)
    response = Gurunabi.fetch_gurunabi_api(**kwargs)
    resouces = response['rest'].map do |shop|
      shop.merge(
        'reviews' => [],
        'stars' => [],
        'star_count' => 0,
      )
    end

    shop_ids = resouces.map { |shop| shop['id'] }

    Review.where(gnavi_shop_id: shop_ids).each do |review|
      shop = resouces.find { |shop| shop['id'] == review.gnavi_shop_id }
      shop['reviews'].push review
    end

    Star.where(gnavi_shop_id: shop_ids).each do |star|
      shop = resouces.find { |shop| shop['id'] == star.gnavi_shop_id }
      shop['stars'].push star
      shop['star_count'] += 1
    end

    response['rest'] = resouces
    response
  end
end
