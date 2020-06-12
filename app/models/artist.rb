class Artist < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :products

  enum category: [ :spectacle, :concert, :jeune_public ]

  mount_uploader :image, ImageUploader

  validates :name, presence: true
end
