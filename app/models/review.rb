class Review < ApplicationRecord
  belongs_to :user

  validates :user_id, :gnavi_shop_id, :score, :comment, presence: true
  validates :user_id, uniqueness: { scope: %i[gnavi_shop_id] }
  validates_numericality_of :score,
    only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5
end
