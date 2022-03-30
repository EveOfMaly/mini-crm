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
        # binding.pry
        # User.find_or_create_by(uid: auth['uid']) do |u|
        #     u.name = auth['info']['name']
        #     u.email = auth['info']['email']
        #     u.image = auth['info']['image']
        #   end
    
        # session[:user_id] = @user.id
    end

    def destroy 
    end

    private

    def auth 
        request.env['omniauth.auth']
    end



end
