module ApplicationHelper
    def current_user
        User.find(session[:user_id])
    end

    def set_session
        session[:user_id] = @user.id
    end
end
