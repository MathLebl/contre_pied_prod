class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_artist, only: [ :show ]
  def index
    @artists = Artist.all
  end

  def show
  end

  def enfant
    @artists = Artist.where(category: "enfant")
  end

  def spectacle
     @artists = Artist.where(category: "spectacle")
  end

  def concert
     @artists = Artist.where(category: "artists")
  end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end
end
