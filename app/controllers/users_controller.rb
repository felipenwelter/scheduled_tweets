class UsersController < ApplicationController

    def list
       @UserList = User.all
    end

    def destroy
        userEmail = User.find_by(id: params[:id]).email
        User.find(params[:id]).destroy
        redirect_to users_path, notice: "User " + userEmail + " deleted successfully"
    end

end
