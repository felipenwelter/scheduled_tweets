class ApplicationController < ActionController::Base
    # this is where all of our controllers inherit from
    # things here are shared across all application

    before_action :set_current_user
    # before run any methods inside all controllers, run this

    def set_current_user
        if session[:user_id]
            # @user = User.find(session[:user_id]) # this is certainly found, throw an error if not
            Current.user = User.find_by(id: session[:user_id]) # this doesn't throw an error
        end
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must be signed in to do that" if Current.user.nil?
    end

end
