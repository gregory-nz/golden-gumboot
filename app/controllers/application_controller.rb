class ApplicationController < ActionController::Base
  layout :determine_layout
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def determine_layout
    logged_in? ? "application" : "logged_out_layout"
  end
end
