class PagesController < ActionController::Base
     layout'application'

    before_action :get_app, only: [:index, :new, :show, :edit, :update, :destroy]
    before_action :set_page, only:[:show, :edit, :update, :destroy]


    def index 
        
        @pages = @app.pages
        
    end 

    def new 
        @page = Page.new
    end

    def create 
        @page = Page.new(page_params)

        if @page.save 
            # session[:page_id] = @page.id
            # session[:app_id] = @page.app.id
            redirect_to controller: "pages", action: 'index'
        else 
            render :new
        end
        

    end

    def show 
        ahoy.track "My first event", language: "Ruby"
        @contact = Contact.new
        render layout: '_bio_link'
        # render plain: "You IP address is #{client_ip}"
    end


    private

    def get_app
        @app =  App.find(params[:app_id])
    end

    def set_page
        @page = @app.pages.find(params[:id])
    end


    def page_params 
        params.require(:page).permit(:title, :url, :user_id, :app_id, :owner)
    end
    

    

end
