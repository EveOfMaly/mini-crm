class UsersController < ApplicationController
    before_action :get_app, only: [:index, :show, :edit, :update, :destroy]
    skip_before_action :get_app, only: [:welcome, :welcome_create_lead]
    before_action :set_user, only:[:show, :edit, :update, :destroy]
 
    def index 
        @users = @app.users
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

    private 

    def get_app
        @app =  App.find(params[:app_id])
    end

    def set_user 
        @user = @app.users.find(params[:id])
    end
    
    def user_params 
        params.require(:user).permit(:username, :email, :password, :app_id)
    end


end
