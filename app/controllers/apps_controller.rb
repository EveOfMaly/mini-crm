class AppsController < ApplicationController
    # skip_before_action :track_ahoy_visit, only: [:home, :index, :show, :new, :create, :destroy]
    def home 

    end

    def index
        @apps = App.all 
    end

    def show 
        @app = App.new
    end

    def new 
        @app = App.new
    end

    def create 
        @app = App.new
    end

    def destroy 
        @app = App.new
    end


    #note

end
