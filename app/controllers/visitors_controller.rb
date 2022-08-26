class VisitorsController < ApplicationController
    before_action :get_app, only: [:index, :new, :show, :edit, :update, :destroy, :most_recent]
    before_action :set_visitors, only: [:show, :edit, :update, :destroy]
    before_action :require_login, only: [:index, :create, :show, :edit, :update, :destroy]

    #display a list of all visitors on the app that belong to the instance of an app
    def index
        @visitors = current_user.visits
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


    def most_recent
        @most_recent = current_user.visits.last(3)
        # @most_recent = Visitor.most_recent
    end




    private

    def get_app
        @app =  App.find(params[:app_id])
    end

    def set_visitors 
        @visitor = current_user.visits.find(params[:id])
    end
    
    def visitor_params 
        params.require(:visitor).permit(:name, :spent, :age, :email, :gender, :first_seen,  :last_visit, :region, :city, :country_code, :app_id, :user_id)
    end

   



end
