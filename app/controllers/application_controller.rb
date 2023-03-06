class ApplicationController < ActionController::Base
    helper_method :current_user
    protect_from_forgery with: :exception

    def login?
      if current_user.nil?
         redirect_to login_path
      end
    end

    def already_login?
      unless current_user.nil?
        redirect_to photo_info_path
      end
    end

    def current_user
      if session[:user_id]
        current_user ||= User.find(session[:user_id])
      end
    end
end
