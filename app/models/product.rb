class Product < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :orders
  has_many :sizes
  belongs_to :shop_category
  belongs_to :artist
  monetize :price_cents
  has_one_attached :product_image
  has_one_attached :product_image2
  has_one_attached :product_image3
  has_one_attached :product_image4
  has_one_attached :product_image5
  has_one_attached :product_image6
  has_one_attached :product_image7
  has_one_attached :product_image8
  has_one_attached :product_image9
  has_one_attached :product_image10
  has_one_attached :product_image11
  has_one_attached :product_image12
  has_one_attached :product_image13
  has_one_attached :product_image14
  has_one_attached :product_image15
end
