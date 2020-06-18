class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  monetize :amount_cents

  scope :payées, -> { where.not(state:"pending") }
  scope :enAttente, -> { where(state:"pending") }
end
