class Artist < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true
  validates :category, inclusion: { in: ["Spectacle", "Concert", "Jeune Public"] }
end
