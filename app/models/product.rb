class Product < ApplicationRecord
  belongs_to :shop_category
  belongs_to :artist
  monetize :price_cents
end
