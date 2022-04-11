class ApplicationController < ActionController::Base
    # after_action :track_action
    # skip_before_action :track_ahoy_visit
    
    include SessionsHelper


    #find the id of the current visitor
    def current_visitor_ahoy_id
        return unless session[:visitor_id]
        @current_visitor ||= Ahoy::Visitor.find(session[:visitor_id])
    end
    
    #if user isn't logged in redirect to home
    def require_login 
        redirect_to "/" unless session.include? :user_id
    end

    #find client ip if in live if in prduction check on below site
    def remote_ip 
        if Rails.env.production?
            request.remote_ip
        else
            Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
        end
    end

    #get the app_id
    def get_app
        @app =  App.find(params[:app_id])
    end

    def identify 
        Visitor.all.select do |visitor|
            if @contact.visitor_id == visitor.id
                @identity = Identity.new(visitor_id: visitor.id, contact_id: @contact.visitor_id)
                
                @identity.identity_confirmed = true 
                @identity.save 
                flash[:message] = "Contact Identified"
                redirect_to controller: "contacts", action: 'index', app_id: @contact.app.id
            else
                flash[:message] = "Contact Activity not found"
            end
        end
    end
 

end
