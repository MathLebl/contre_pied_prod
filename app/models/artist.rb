class Artist < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true, uniqueness: true
  validates :category, inclusion: { in: %w(concert spectacle enfant),  message: "%{value} is not a valid size"}
end
