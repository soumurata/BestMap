class Map < ApplicationRecord
  # 存在性のバリデーション
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :title, presence: true

  # バリデーションの前に送信されたaddressの値によってジオコーディング(緯度経度の算出)を行う
  geocoded_by :address
  before_validation :geocode
  # after_validation :geocode, if: :address_changed?

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  belongs_to :user
end
