class ApplicationController < ActionController::Base
include SessionsHelper
    def hello_world
        if logged_in?
        redirect_to users_path
        else
            redirect_to login_path
        end
    end
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
    def check_user
        redirect_to login_path unless logged_in?
    end
    def check_user_post
        redirect_to user_path unless current_user
    end
end