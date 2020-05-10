class Artist < ApplicationRecord
  belongs_to :user
  has_many :events

  enum category: [ :spectacle, :concert, :jeune_public ]


  validates :name, presence: true
end
