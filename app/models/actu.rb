class Actu < ApplicationRecord
  belongs_to :artist
  belongs_to :user

  scope :publiées, -> { where.not(published_at:nil) }
  scope :nonPubliées, -> { where(published_at:nil) }

   mount_uploader :illustration, IllustrationUploader

end
