class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :prepare_foursquare_service

  helper_method :current_user



  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) unless session[:user_id].nil?
  end

  def prepare_foursquare_service
    current_user.set_service_with_user(current_user) unless current_user.nil?
  end
end
