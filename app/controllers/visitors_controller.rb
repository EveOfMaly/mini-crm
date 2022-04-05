class VisitorsController < ApplicationController
    before_action :get_app, only: [:index, :new, :show, :edit, :update, :destroy]
    before_action :set_visitors, only:[:show, :edit, :update, :destroy]
   
   
    def index 
        if params[:app_id]
            @visitor = @app.visitors
        else 
            @visitor = Visitor.all 
        end
    end


    
    def new 
        @visitor = Visitor.new
    end

   
    def create 

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
        @app = App.find(params[:app_id])
        @visitor = Visitor.find(params[:id])
    end


    def edit 
        @app = App.find(params[:app_id])
        @visitor = Visitor.find_by(id: params[:id])
    end

    def update 
        @visitor = Visitor.find_by(id: params[:id])
        @visitor.update(visitor_params)
        redirect_to app_visitors_path(@visitor.app)

    end

    def destroy
        @visitor = Visitor.find(params[:id]).destroy
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
