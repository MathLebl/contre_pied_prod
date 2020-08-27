class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def home
    events = Event.order('date ASC')
    @events = events.first(8)
    actus = Actu.all
    @actus = actus.first(4)

    machin = {
      "id": "evt_1HKlR6J0As8BjpLS6YD8hTuY",
      "object": "event",
      "api_version": "2020-03-02",
      "created": 1598535999,
      "data": {
        "object": {
          "id": "pi_1HKlQWJ0As8BjpLS6frwzy4h",
          "object": "payment_intent",
          "amount": 3600,
          "amount_capturable": 0,
          "amount_received": 3600,
          "application": nil,
          "application_fee_amount": nil,
          "canceled_at": nil,
          "cancellation_reason": nil,
          "capture_method": "automatic",
          "charges": {
            "object": "list",
            "data": [
              {
                "id": "ch_1HKlR5J0As8BjpLSZfzdoHTl",
                "object": "charge",
                "amount": 3600,
                "amount_refunded": 0,
                "application": nil,
                "application_fee": nil,
                "application_fee_amount": nil,
                "balance_transaction": "txn_1HKlR5J0As8BjpLSVaBXydx3",
                "billing_details": {
                  "address": {
                    "city": nil,
                    "country": "FR",
                    "line1": nil,
                    "line2": nil,
                    "postal_code": nil,
                    "state": nil
                  },
                  "email": "tototo@laposte.net",
                  "name": "tototo",
                  "phone": nil
                }
              }
            ]
          }
        }
      }
    }
    puts "_________________-"
    puts machin[:data][:object][:charges][:data][0][:billing_details][:email]
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
    when 'payment_intent.canceled'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      user = User.find_by(email: event[:data][:object][:charges][:data][0][:billing_details][:email])
      last_order = user.orders.last
      last_order.state = "Annulé"
    when 'payment_intent.payment_failed'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      user = User.find_by(email: event[:data][:object][:charges][:data][0][:billing_details][:email])
      last_order = user.orders.last
      last_order.state = "Echec"
    # ... handle other event types
    else
      # Unexpected event type
      # status 400
      return
    end
  
    # status 200
  end
end
