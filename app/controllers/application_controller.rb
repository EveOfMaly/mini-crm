class ApplicationController < ActionController::Base

    include SessionsHelper

    def home  
    end

    def require_login 
        redirect_to "/" unless session.include? :user_id
    end

    #find client ip if in live if in prduction check on below site
    def client_ip 
        if Rails.env.production?
            request.remote_ip
        else
            Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
        end
    end

 




end
