class Product < ApplicationRecord

  # before_save :set_photo_url

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

<<<<<<< HEAD
# def set_photo_url
#     self.photo_url = product_image.url
#   end
=======
def set_photo_url
    self.photo_url = product_image.service_url
  end
>>>>>>> 9db3da09cc84305cda43b4ad0473fae38243c0d5


end
