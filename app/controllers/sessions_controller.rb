class SessionsController < ApplicationController
  require 'securerandom'


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
      session.delete :user_id 
      redirect_to '/login'
    end

    def facebook_create
      @user = User.find_or_initialize_by(name: auth['info']['name']) do |u|
        u.name = auth['info']['name']
      end

      if !@user.persisted?
        @user.family_id = 3
        @user.password = SecureRandom.base64(15)
        @user.save
        session[:user_id] = @user.id
        redirect_to edit_user_path(@user)
      else
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    end
   
    private
   
    def auth
      request.env['omniauth.auth']
    end
  

end
