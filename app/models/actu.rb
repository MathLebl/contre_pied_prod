class Actu < ApplicationRecord
  belongs_to :artist
  belongs_to :user

   # mount_uploader :illustration, IllustrationUploader

end
