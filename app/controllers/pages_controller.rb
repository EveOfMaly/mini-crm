class PagesController < ActionController::Base
     layout'application'

    before_action :get_app, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    before_action :set_page, only:[:show, :edit, :update, :destroy]

    skip_before_action :track_ahoy_visit, only:[:index, :new, :create]
    
    after_action :track_action, only: [:show]
    before_action :require_login, only: [:index, :new, :create]



    def index         
        @pages = @app.pages
    end 

    def new 
        @page = Page.new
    end

    def create 
        @page = Page.new(page_params)

        if @page.save 
            redirect_to controller: "pages", action: 'index'
        else 
            render :new
        end

    end

    def show 

        @contact = Contact.new
        render layout: 'bio_link'
        # render plain: "You IP address is #{client_ip}" 
    
    end


    private

    def require_login 
        redirect_to "/" unless session.include? :user_id
    end


    def get_app
        @app =  App.find(params[:app_id])
    end

    def set_page
        @page = @app.pages.find(params[:id])
    end


    def page_params 
        params.require(:page).permit(:title, :url, :user_id, :app_id, :owner)
    end
    
    def track_action
        ahoy.track "Visited Page", request.path_parameters
    end

    

end
