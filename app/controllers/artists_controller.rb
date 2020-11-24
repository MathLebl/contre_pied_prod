class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_artist, only: [ :show ]
  before_action :find_artist_jp, only: [ :show_jp ]


  def index
    # if params[:id].present?
    #   @artists = Artist.all.select { |artist| artist.id == params[:id].to_i }
    # else
    #   @artists = Artist.all
    # end
    @artists = Artist.order(ranking: :asc)
  end

  def show
    @events = Event.where(artist_id: @artist.id).order('date ASC').select { |event| event.date > DateTime.now }
    @distributions = Distribution.where(artist_id: @artist.id)
    @presses = Presse.where(artist_id: @artist.id)
    @partenaires = Partenaire.where(artist_id: @artist.id)
    @credits = Credit.where(artist_id: @artist.id)
  end

  def show_jp
    @events = Event.where(artist_id: @artist.id).order('date ASC')
    @distributions = Distribution.where(artist_id: @artist.id)
    @presses = Presse.where(artist_id: @artist.id)
    @partenaires = Partenaire.where(artist_id: @artist.id)
    @credits = Credit.where(artist_id: @artist.id)
  end

  def jeune_public
    @artists = Artist.where(category: "jeune_public").order(ranking: :asc)
    # events = Event.where(category: "jeune_public").order('date ASC')
    # @events = events.first(8)
    @all_events = []
    @artists.each do |art|
      @all_events << art.events
    end
    @events = @all_events.flatten.first(8).sort_by { |event| event.date }

  end

  def spectacle
    @artists = Artist.where(category: "spectacle").order(ranking: :asc)
    @all_events = []
    @artists.each do |art|
      @all_events << art.events
    end
    @events = @all_events.flatten.first(8).sort_by { |event| event.date }
  end

  def concert
    @artists = Artist.where(category: "concert").order(ranking: :asc)
    @all_events = []
    @artists.each do |art|
      @all_events << art.events
    end
    @events = @all_events.flatten.first(8).sort_by { |event| event.date }
  end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def find_artist_jp
    artists = Artist.where(category: "jeune_public")
    @artist = artists.find(params[:id])
  end

end

