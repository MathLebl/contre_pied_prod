class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_artist, only: [ :show ]
  def index
    @artists = Artist.all
  end

  def show
    @events = Event.where(artist_id: @artist.id).order('date ASC')
  end

  def jeune_publique
    @artists = Artist.where(category: "Jeune Publique")
    events = Event.where(category: "jeune publique").order('date ASC')
    @events = events.first(8)
  end

  def theatre
     @artists = Artist.where(category: "Theatre")
     events = Event.where(category: "theatre").order('date ASC')
     @events = events.first(8)
  end

  def concert
     @artists = Artist.where(category: "Concert")
     events = Event.where(category: "concert").order('date ASC')
     @events = events.first(8)
  end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end
end
