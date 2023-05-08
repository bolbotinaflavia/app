module SessionsHelper
    def log_in(user)
        session[:user_id]=user.id
    end
    def current_user
        if session[:user_id].present?
            User.find_by(id:session[:user_id])
        end
    end
    def log_out
        session[:user_id]=nil
    end
    def logged_in?
        current_user.present?
    end
    # return true if given user is the current user
    def current_user?(user)
        current_user==user
    end
end
