class Product < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :orders
  belongs_to :shop_category
  belongs_to :artist
  monetize :price_cents
  has_one_attached :product_image
end
