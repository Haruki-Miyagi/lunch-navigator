class Star < ApplicationRecord
  belongs_to :user

  validates :user_id, :gnavi_shop_id, presence: true
  validates :user_id, uniqueness: { scope: %i[gnavi_shop_id] }
end
