# frozen_string_literal: true

# main application class
class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path
  end
end
