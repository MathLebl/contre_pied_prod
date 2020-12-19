class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_event, only: [ :show ]

  def index
    @regions = Event.select(:region).group(:region).collect{|e| e.region}
    @artists = Artist.all
    @months = Event.select(:month).group(:month).collect{|e| e.month}
    if params[:region].present?
      @events = Event.all.order('date ASC').select { |event| event.region == params[:region]}.select { |event| event.date > DateTime.now }
    elsif params[:artist_id].present?
      @events = Event.order('date ASC').where(artist_id: params[:artist_id]).select { |event| event.date > DateTime.now }
    elsif params[:month].present?
      @events = Event.order('date ASC').where(month: params[:month]).select { |event| event.date > DateTime.now }
    else
      @events =Event.all.order('date ASC').select { |event| event.date > DateTime.now }
    end
  end

  def show
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

end

