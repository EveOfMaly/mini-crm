class UsersController < ApplicationController

    before_action :require_login, only: [:show]
    
    def index 
        @users = User.all
    end

    def welcome 
        @user = User.new
    end

    def welcome_create_lead
        @user = User.new(user_params)
        render :new
    end

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)

        if @user.save 
            session[:user_id] = @user.id
            binding.pry
            redirect_to user_path(@user)
        else 
            render :new
        end

    end

    def edit 
        @user = User.find_by(id: params[:id])
    end

    def update 
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end


    def destroy
        @user = User.find(params[:id]).destroy
        redirect_to "/"
    end

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end


end
