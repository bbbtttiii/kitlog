class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :current_user
    before_action :redirect_if_not_logged_in

    def current_user
        @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to root_path
        end
    end

end