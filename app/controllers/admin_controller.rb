class AdminController < ApplicationController
    def show
        @user = User.where(admin: true).first
        if !current_user.admin?
            redirect_to '/users/'
        end
    end
    
end
