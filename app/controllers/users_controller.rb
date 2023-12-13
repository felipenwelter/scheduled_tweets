class UsersController < ApplicationController

    before_action :require_user_logged_in!

    def list
       @UserList = User.order(:name).all
    end

    def destroy
        user = User.find(params[:id])
        userEmail = user.email
        user.destroy
        redirect_to users_path, notice: "User " + userEmail + " deleted successfully"
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:user][:id])
        if @user.update(user_params)
            redirect_to users_path, notice: "The user was successfully updated"
        else
            render :edit
        end
    end

    def user_params
        params.require(:user).permit(:name)
    end

end
