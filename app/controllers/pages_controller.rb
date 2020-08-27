class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def home
    events = Event.order('date ASC')
    @events = events.first(8)
    actus = Actu.all
    @actus = actus.first(4)
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
      puts "________________________________________"
      puts 'PaymentIntent was successful!'
    when 'payment_method.attached'
      payment_method = event.data.object # contains a Stripe::PaymentMethod
      puts 'PaymentMethod was attached to a Customer!'
    # ... handle other event types
    else
      # Unexpected event type
      # status 400
      return
    end
  
    # status 200
  end
end
