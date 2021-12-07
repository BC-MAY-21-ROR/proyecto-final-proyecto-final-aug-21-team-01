# frozen_string_literal: true

# main application class
class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    groups_path
  end
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path
  end
end
