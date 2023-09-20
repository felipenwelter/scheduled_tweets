class RegistrationsController < ApplicationController
    def new
        @user = User.new
        # this instance variable (@user) instead of a regular variable (local, this method) so it is visible in the view
    end
end