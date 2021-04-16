class ApplicationController < ActionController::Base
    def current_user
        User.find(session[:user_id])
    end

    def clear_flash
        if flash[:message]
            flash.delete("message")
        end
    end
end
