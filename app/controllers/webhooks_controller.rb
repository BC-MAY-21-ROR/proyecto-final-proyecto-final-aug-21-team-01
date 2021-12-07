# frozen_string_literal: true

# Class to manage stripe webhooks events in order to view subscriptions status
class WebhooksController < ApplicationController
  protect_from_forgery except: :create
  layout 'dashboard'
  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil
    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, ENV['STRIPE_SIGNING_SECRET']
      )
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts 'Signature error'
      p e
      return
    end
    # Handle the event
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      @user = User.find_by(stripe_id: session.customer)
      @user.update_attribute(:role, :premium)
    when 'customer.subscription.updated', 'customer.subscription.deleted'
      subscription = event.data.object
      @user = User.find_by(stripe_id: subscription.customer)
      subscription_plan = subscription.status == 'active' ? 'premium' : 'free'
      @user.update_attribute(:role, subscription_plan)
    end
    render json: { message: 'success' }
  end
end
