class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_event, only: [ :show ]

  def index
    @cities = Event.select(:city).group(:city).collect{|e| e.city}
    if params[:city].present?
      @events = Event.all.order('date ASC').select { |event| event.city == params[:city]}
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
