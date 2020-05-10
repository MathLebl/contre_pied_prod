class Event < ApplicationRecord
  belongs_to :artist
  belongs_to :user

  enum category: [ :spectacle, :concert, :jeune_public ]

end
