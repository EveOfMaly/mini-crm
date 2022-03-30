class UsersController < ApplicationController

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
        binding.pry
        @user = User.new
    end

    def create 
        @user = User.new(user_params)

        if @user.save 
            redirect_to "/signup"
        else 
            render :new
        end

    end

    def update 

    end


    def destroy
    end

    def user_params 
        params.require(:user).permit(:name, :email, :password)
    end


end
