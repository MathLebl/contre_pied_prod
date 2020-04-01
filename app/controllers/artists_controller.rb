class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_artist, only: [ :show ]
  def index
    @artists = Artist.all
  end

  def show
    @events = Event.where(artist_id: @artist.id)
  end

  def enfant
    @artists = Artist.where(category: "enfant")
    @events = Event.where(category: "enfant").order('date ASC')
  end

  def theatre
     @artists = Artist.where(category: "theatre")
     @events = Event.where(category: "theatre").order('date ASC')
  end

  def concert
     @artists = Artist.where(category: "concert")
     @events = Event.where(category: "concert").order('date ASC')
  end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end
end
