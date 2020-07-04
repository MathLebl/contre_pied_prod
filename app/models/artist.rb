class Artist < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :products

  has_one_attached :image
  has_one_attached :press_file

  scope :concert, -> { where.(category:"concert") }
  scope :spectacle, -> { where(category:"spectacle") }
  scope :jeunePublic, -> { where(category:"jeune_public") }


  enum category: [ :spectacle, :concert, :jeune_public ]

  validates :name, presence: true
end
