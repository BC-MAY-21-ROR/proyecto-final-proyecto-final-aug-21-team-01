# frozen_string_literal: true

# main application class
class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || groups_path
  end

end
