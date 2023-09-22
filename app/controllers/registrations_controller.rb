class RegistrationsController < ApplicationController
    def new
        @user = User.new
        # this instance variable (@user) instead of a regular variable (local, this method) so it is visible in the view
    end

    def create
        # Parameters: {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"a@a.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}
        @user = User.new(user_params)
        # "user"=>{"email"=>"a@a.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
        if @user.save
            redirect_to root_path, notice: "Successfully created account"
        else
            render :new
        end

    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
        # this will raise an error in case there is no :user. Otherwise we could just use params[:user]
    end

end