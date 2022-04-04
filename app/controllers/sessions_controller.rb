class SessionsController < ApplicationController

    #google oauth method 
    def omniauth 
        @user = User.from_omniauth(request.env['omniauth.auth'])

        if @user.valid?
            session[:user_id] = @user.id
            session[:app_id] = @user.app.id
            redirect_to controller: "contacts", action: 'index', app_id: @user.app.id
        else 
            redirect_to "/"
        end
    end

    #form signup paths
    def new 
        render layout: false
    end

    #login
    def create 
        @user = User.find_by(username: params[:username])
        
        if @user.try(:authenticate, params[:password])
            session[:user_id] = @user.id
            redirect_to controller: "contacts", action: 'index', app_id: @user.app.id
        else 
            redirect_to "/login"
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
