class UsersController < ApplicationController

 
    def index 
        @users = User.all
    end

    def welcome 
        @user = User.new
        render layout: 'welcome'
    end

    def welcome_create_lead

        @user = User.new(user_params)
        render layout: false
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
            session[:app_id] = @user.app.id
            redirect_to app_contacts_path(@user.app)
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
        redirect_to app_contacts_path(@user.app)
    end


    def destroy
        @user = User.find(params[:id]).destroy
        redirect_to "/"
    end

    def user_params 
        params.require(:user).permit(:username, :email, :password, :app_id)
    end


end
