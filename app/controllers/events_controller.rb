class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_event, only: [ :show ]

  def index
    @cities = Event.select(:city).group(:city).collect{|e| e.city}
    @artists = Event.select(:artist_id).group(:artist_id).collect{|e| e.artist.name}
    @dates = Event.select(:date).group(:date).order('date ASC').collect{|e| l e.date}
    if params[:city].present?
      @events = Event.all.order('date ASC').select { |event| event.city == params[:city]}
    elsif params[:artist_id].present?
      @events = Event.all.order('date ASC').select { |event| event.artist == params[:artist_id]}
    elsif params[:date].present?
      @events = Event.all.order('date ASC').select { |event| event.date == params[:date]}
    else
      @events = Event.all.order('date ASC')
    end
  end

  def show
  end

   private

  def find_event
    @event = Event.find(params[:id])
  end

end
