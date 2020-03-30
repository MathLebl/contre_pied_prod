class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @events = Event.first(10)
  end

  def legals
  end

  def about
  end

end
