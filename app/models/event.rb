class Event < ApplicationRecord
  belongs_to :artist
  belongs_to :user

  validates :category, presence: true
end
