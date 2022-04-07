class ApplicationController < ActionController::Base
    # after_action :track_action
    # skip_before_action :track_ahoy_visit


    include SessionsHelper


    # def track_action
    #     ahoy.track "Ran action", request.path_parameters
    # end
    

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
