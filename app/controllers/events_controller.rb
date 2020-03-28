class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_event, only: [ :show ]
  def index
    @events = Event.all
  end

  def show
  end

   private

  def find_event
    @event = Event.find(params[:id])
  end

end
