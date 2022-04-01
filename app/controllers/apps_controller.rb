class AppsController < ApplicationController
   
    def home 
        render layout: false
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
