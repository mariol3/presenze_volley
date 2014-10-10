class ApplicationController < ActionController::Base
  before_filter :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  
    def authorize
      unless current_logged_player
        redirect_to :home
      end
    end
    
    def current_logged_player
      Player.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
      rescue ActiveRecord::RecordNotFound
        nil
    end 
  
end
