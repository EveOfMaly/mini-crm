class VisitorsController < ApplicationController
    before_action :get_app, only: [:index, :new, :show, :edit, :update, :destroy]
    before_action :set_visitors, only: [:show, :edit, :update, :destroy]
    

    #display a list of all visitors on the app that belong to the instance of an app
    def index
        @visitors = @app.visitors
    end


   
    def create 
        binding.pry
        @visitor = Visitor.new(visitor_params)

        if @visitor.save 
            # session[:visitor_id] = @visitor.id
            # session[:app_id] = @visitor.app.id
            redirect_to controller: "visitors", action: 'index'
        else 
            render :new
        end
    end

    def show 
 
    end


    def edit 
       
    end

    def update 
        @visitor.update(visitor_params)
        redirect_to app_visitors_path(@visitor.app)

    end

    def destroy
        redirect_to "/"
    end




    private

    def get_app
        @app =  App.find(params[:app_id])
    end

    def set_visitors 
        @visitor = @app.visitors.find(params[:id])
    end
    
    def visitor_params 
        params.require(:visitor).permit(:name, :spent, :age, :email, :gender, :first_seen,  :last_visit, :region, :city, :country_code, :app_id, :user_id)
    end

   



end
