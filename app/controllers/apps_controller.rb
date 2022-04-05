class AppsController < ApplicationController
    before_action :get_app
    # skip_before_action :track_ahoy_visit, only: [:home, :index, :show, :new, :create, :destroy]
    def home 

    end

    def index
        @apps = App.all 
    end

    def show 
    
    end

    def new 
    end

    def create 
    end

    def destroy 
    end


    #note

end
