class ApplicationController < ActionController::Base
    helper_method :current_user
  
    def logged_in?
      !current_user.nil?
    end

    private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    helper_method :logged_in?
  end
  