class PagesController < ActionController::Base
 
    def index 
        binding.pry
        render plain: "You IP address is #{client_ip}"
    end 

    private 
    def client_ip 
        if Rails.env.production?
            request.remote_ip
        else
            Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
        end
    end



end
