class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def home
    # events =Event.all.order('date ASC').select { |event| event.date > DateTime.now }
    # @events = events.first(8)
    @actus = Actu.all

 @regions = Event.select(:region).group(:region).collect{|e| e.region}
    @artists = Artist.all
    @months = Event.select(:month).group(:month).collect{|e| e.month}
    if params[:region].present?
      events = Event.all.order('date ASC').select { |event| event.region == params[:region]}.select { |event| event.date > DateTime.now }
    elsif params[:artist_id].present?
      events = Event.order('date ASC').where(artist_id: params[:artist_id]).select { |event| event.date > DateTime.now }
    elsif params[:month].present?
      events = Event.order('date ASC').where(month: params[:month]).select { |event| event.date > DateTime.now }
    else
      events =Event.all.order('date ASC').select { |event| event.date > DateTime.now }
    end
    @events = events.first(8)
  end

  def legals
  end

  def about
  end

  def contacts
  end

  def boutique
  end

  def retraite
  end

  # Stripe Webhook
  def webhook
    # payload = request.body.read
    # parsed = JSON.parse(payload)
    # puts "_____________________________________________________"
    # puts parsed
    payload = request.body.read
    event = nil

    begin
      event = Stripe::Event.construct_from(
        JSON.parse(payload, symbolize_names: true)
        )
    rescue JSON::ParserError => e
      # Invalid payload
      # status 400
      return
    end

    # Handle the event
    case event.type
    when 'payment_intent.succeeded'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      user = User.find_by(email: event[:data][:object][:charges][:data][0][:billing_details][:email])
      last_order = user.orders.last
      last_order.state = "Payé"
      last_order.save
    when 'payment_intent.canceled'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      user = User.find_by(email: event[:data][:object][:charges][:data][0][:billing_details][:email])
      last_order = user.orders.last
      last_order.state = "Annulé"
      last_order.save
    when 'payment_intent.payment_failed'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      user = User.find_by(email: event[:data][:object][:charges][:data][0][:billing_details][:email])
      last_order = user.orders.last
      last_order.state = "Echec"
      last_order.save
      # ... handle other event types
    else
      # Unexpected event type
      # status 400
      return
    end

    # status 200
  end
end
