class PagesController < ActionController::Base
 
    def index 
        render plain: "You IP address is #{client_ip}"
    end 

    def new 
        @page = Page.new
    end

    def create 

    end


    



end
