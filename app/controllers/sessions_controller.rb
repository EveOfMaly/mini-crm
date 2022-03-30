class SessionsController < ApplicationController

    def new 
    end

    def omniauth 
        @user = User.find_or_create_by(uid: auth[])


    end

    def create 
        binding.pry
        User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
          end
    
        session[:user_id] = @user.id
    end

    def destroy 
    end

    private

    def auth 
        request.env['omniauth.auth']
    end



end
