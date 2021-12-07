# frozen_string_literal: true

# Class to manage manage the billing portal and to show current user actual plan
class PreferencesController < ApplicationController
  layout 'dashboard'
  def plan; end

  def billing
    current_user.create_stripe_id if current_user.stripe_id.nil?
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    session = Stripe::BillingPortal::Session.create({
                                                      customer: customer,
                                                      return_url: account_suscription_url
                                                    })
    redirect_to session.url
  end
end
