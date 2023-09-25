class MainController < ApplicationController
    def index
        if session[:user_id]
            # @user = User.find(session[:user_id]) # this is certainly found, throw an error if not
            @user = User.find_by(id: session[:user_id]) # this doesn't throw an error
        end
    end
end