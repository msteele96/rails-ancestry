class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.name != "" && @user.born != nil
            @user.living?
            if @user.save
                session[:user_id] = @user.id
                clear_flash
                redirect_to user_path(@user)
            end
        else
            flash[:message] = "Invalid data."
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end

    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        @user.living?
        redirect_to user_path(@user)
    end

    def destroy
        @user = User.find(params[:id])
        if current_user == @user
            @user.delete
            session.delete :user_id 
        end
        redirect_to '/login'
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :born, :died)
    end

end
