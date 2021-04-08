class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:name])
        if @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          redirect_to '/login'
        end
    end

    def destroy
        redirect_to '/login'
    end

end
