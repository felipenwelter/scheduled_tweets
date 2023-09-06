class MainController < ApplicationController
    def index
        flash.now[:notice] = "logged in successfully"
        flash.now[:alert] = "invalid email or password"
    end
end