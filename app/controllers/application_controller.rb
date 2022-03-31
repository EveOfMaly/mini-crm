class ApplicationController < ActionController::Base

    include SessionsHelper

    def home  
    end

    def require_login 
        redirect_to "/" unless session.include? :user_id
    end

 




end
