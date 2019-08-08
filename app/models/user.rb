class User < ApplicationRecord
  has_many :stars
  has_many :reviews

  validates :account, presence: true
  validates :account, uniqueness: true
end
