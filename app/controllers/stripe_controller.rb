# frozen_string_literal: true

# Class to manage stripe upgrade and downgrade for the premium and free account
class StripeController < ApplicationController
  layout 'dashboard'
  def upgrade
    current_user.create_stripe_id if current_user.stripe_id.nil?
    @session = Stripe::Checkout::Session.create({
                                                  mode: 'subscription',
                                                  customer: current_user.stripe_id,
                                                  line_items: [{
                                                    quantity: 1,
                                                    price: 'price_1K3whvHfplhL02rUxfAhUI12'
                                                  }],
                                                  success_url: groups_url,
                                                  cancel_url: account_suscription_url
                                                })
    respond_to do |format|
      format.js
    end
  rescue StandardError => e
    halt 400,
         { 'Content-Type' => 'application/json' },
         { 'error': { message: e.error.message } }.to_json
  end

  def downgrade
    subscription = Stripe::Subscription.list(customer: current_user.stripe_id).first
    Stripe::Subscription.delete(
      subscription.id
    )
    current_user.update_attribute(:role, :free)
    redirect_to account_suscription_path,
                notice: 'You have cancelled your subscription. You are now free user and you can create only 4 groups'
  rescue StandardError => e
    halt 400,
         { 'Content-Type' => 'application/json' },
         { 'error': { message: e.error.message } }.to_json
  end
end
