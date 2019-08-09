module ShopHelper
  def registration_star(resouce)
    star = auth_star(resouce)
    star_count = Star.where(gnavi_shop_id: resouce['id']).count

    if star.present?
      # 削除リンク
      link = link_to(sanitize('★'), star_path(star), method: :delete)
    else
      # 登録リンク
      link = link_to(sanitize('⭐'), stars_path(gnavi_shop_id: resouce['id']), method: :post)
    end
    
    link + content_tag(:span, star_count)
  end

  def auth_star(resouce)
    if current_user.present?
      Star.find_by(gnavi_shop_id: resouce['id'], user_id: current_user.first[:id])
    else
      Star.find_by(gnavi_shop_id: resouce['id'])
    end
  end
end
