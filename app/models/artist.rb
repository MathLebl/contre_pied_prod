class Artist < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :products
  has_many :distribution
  accepts_nested_attributes_for :distribution
  has_many :credits
  accepts_nested_attributes_for :credits

  has_one_attached :image
  has_one_attached :press_file
  has_one_attached :banner_image
  has_one_attached :show_image1
  has_one_attached :show_image2
  has_one_attached :show_image3
  has_one_attached :show_image4


  scope :concert, -> { where.(category:"concert") }
  scope :spectacle, -> { where(category:"spectacle") }
  scope :jeunePublic, -> { where(category:"jeune_public") }


  enum category: [ :spectacle, :concert, :jeune_public ]

  validates :name, presence: true
end
