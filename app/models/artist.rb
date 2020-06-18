class Artist < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :products

  scope :concert, -> { where.(category:"concert") }
  scope :spectacle, -> { where(category:"spectacle") }
  scope :jeunePublic, -> { where(category:"jeune_public") }


  enum category: [ :spectacle, :concert, :jeune_public ]

  mount_uploader :image, ImageUploader
  mount_uploader :press_file, PressFileUploader

  validates :name, presence: true
end
