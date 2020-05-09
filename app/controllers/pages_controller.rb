class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    events = Event.order('date ASC')
    @events = events.first(8)
    @actus = Actu.all
  end

  def legals
  end

  def about
  end

  def contacts
  end

end
