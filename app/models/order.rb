class Order < ApplicationRecord
  belongs_to :user
  # belongs_to :product
  has_many :items
  has_many :products, through: :items
  accepts_nested_attributes_for :products
  monetize :amount_cents

  validates :address, presence: :true
  validates :city, presence: :true
  validates :zip_code, presence: :true
  validates :phone, presence: :true
  scope :payées, -> { where.not(state:"pending") }
  scope :enAttente, -> { where(state:"pending") }
end
