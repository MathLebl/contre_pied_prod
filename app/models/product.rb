class Product < ApplicationRecord

  unless Rails.env.development?
    before_save :set_photo_url
  end

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

private

def set_photo_url
  self.photo_url = product_image.service_url
end


end
