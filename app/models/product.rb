class Product < ApplicationRecord
  belongs_to :shop_category
  monetize :price_cents
end
