class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :items
  has_many :products, through: :items
  monetize :amount_cents

  scope :payées, -> { where.not(state:"pending") }
  scope :enAttente, -> { where(state:"pending") }
end
