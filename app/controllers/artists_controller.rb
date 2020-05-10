class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_artist, only: [ :show ]
  before_action :find_artist_jp, only: [ :show_jp ]
  def index
    @artists = Artist.all
  end

  def show
    @events = Event.where(artist_id: @artist.id).order('date ASC')
  end

  def show_jp
    @events = Event.where(artist_id: @artist.id).order('date ASC')
  end

  def jeune_public
    @artists = Artist.where(category: "Jeune Public")
    events = Event.where(category: "jeune_public").order('date ASC')
    @events = events.first(8)
  end

  def spectacle
     @artists = Artist.where(category: "Spectacle")
     events = Event.where(category: "spectacle").order('date ASC')
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

  def find_artist_jp
    artists = Artist.where(category: "Jeune Public")
    @artist = artists.find(params[:id])
  end

end

