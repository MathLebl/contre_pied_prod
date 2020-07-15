class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_event, only: [ :show ]

  def index
    @cities = Event.select(:city).group(:city).collect{|e| e.city}
    @artists = Artist.all
    @dates = Event.select(:date).group(:date).order('date ASC').collect{|e| e.date}
    if params[:city].present?
      @events = Event.all.order('date ASC').select { |event| event.city == params[:city]}
    elsif params[:artist_id].present?
      @events = Event.where(artist_id: params[:artist_id])
    elsif params[:date].present?
      @events = Event.where(date: params[:date])
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
