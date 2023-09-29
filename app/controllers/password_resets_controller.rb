class PasswordResetsController < ApplicationController

    def new
        # just render the form
    end

    def create
        @user = User.find_by(email: params[:email])
        
        if @user.present?
            # send email
            PasswordMailer.with(user: @user).reset.deliver_now
            #reset_deliver_now send now, take a second or more and block the request on the browser
            #sends in a backgroud job, doesn't block the request on the browser
        end

        redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password"

    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Your token has expired. Please try again."
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in."
        else
            render :edit
        end
    end


    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end