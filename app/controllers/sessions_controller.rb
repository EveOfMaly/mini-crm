class SessionsController < ApplicationController

    #google oauth method 
    def omniauth 
        @user = User.from_omniauth(request.env['omniauth.auth'])

        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to "/"
        end
    end

    #form signup paths
    def new 
    end

    def create 
        @user = User.find_by(username: params[:username])

        if @user.try(:authenticate, params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render :new
        end
    end

    def destroy 
        session.delete :user_id
        redirect_to "/"
    end

    private

    def auth 
        request.env['omniauth.auth']
    end

    

end
