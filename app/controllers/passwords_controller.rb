class PasswordsController < ApplicationController

    before_action :require_user_logged_in!

    def edit
    end

    def update
        if Current.user.update(password_params)
            redirect_to root_path, notice: "Password updated"
        else
            render :edit
        end
    end

    private
    
    def password_params #helper method
        params.require(:user).permit(:password, :password_confirmation) # the form will submit everything under the model user
        # only able to change the password through this form
    end
end