class SessionsController < ApplicationController
 
    #google oauth method 
    def omniauth 
        @user = User.from_omniauth(request.env['omniauth.auth'])

        if @user.valid?
            session[:user_id] = @user.id
            session[:app_id] = @user.app.id
            ahoy.authenticate(@user)
            
            redirect_to controller: "contacts", action: 'index', app_id: @user.app.id
        else 
            redirect_to "/"
        end
    end

    #form signin paths
    def new 
        @user = User.new
        render layout: 'sign_in_form'
    end

    #login
    def create 
        @user = User.find_by(username: params[:username])
        
        if @user.try(:authenticate, params[:password])
            session[:user_id] = @user.id
            ahoy.authenticate(@user)
            redirect_to controller: "contacts", action: 'index', app_id: @user.app.id
        else 
            flash[:message] = "Please enter a valid username and password"
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
