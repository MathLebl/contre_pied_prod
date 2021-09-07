class Artist < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :products
  has_many :distribution, dependent: :destroy
  accepts_nested_attributes_for :distribution, allow_destroy: true
  has_many :credits, dependent: :destroy
  accepts_nested_attributes_for :credits, allow_destroy: true
  has_many :presse, dependent: :destroy
  accepts_nested_attributes_for :presse, allow_destroy: true
  has_many :partenaires, dependent: :destroy
  accepts_nested_attributes_for :partenaires, allow_destroy: true


  has_one_attached :image
  has_one_attached :press_file
  has_one_attached :banner_image
  has_one_attached :show_image1
  has_one_attached :show_image2
  has_one_attached :show_image3
  has_one_attached :show_image4
  has_one_attached :artist_video


  scope :concert, -> { where.(category:"concert") }
  scope :spectacle, -> { where(category:"spectacle") }
  scope :jeunePublic, -> { where(category:"jeune_public") }


  enum category: [ :spectacle, :concert, :jeune_public ]

  validates :name, presence: true
end
