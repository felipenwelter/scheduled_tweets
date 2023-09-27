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

end
