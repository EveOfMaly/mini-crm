class UsersController < ApplicationController

    before_action :require_login, only: [:show, :edit]

    def index 
        @users = User.all
    end

    def welcome 
        @user = User.new
        render layout: 'welcome'
    end

    def welcome_create_lead
        @user = User.new(user_params)
        render :new
    end

    def show 
        @users = User.all
        @user = User.find_by(id: params[:id])
    end

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)

        if @user.save 
            session[:user_id] = @user.id
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
