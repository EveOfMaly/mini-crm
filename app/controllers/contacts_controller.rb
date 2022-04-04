class ContactsController < ApplicationController
    before_action :get_app, only: [:index, :new, :show, :edit, :update, :destroy]
    before_action :set_contacts, only:[:show, :edit, :update, :destroy]

    def index
        if params[:app_id]
            @contacts = @app.contacts
        else 
            @contacts = Contact.all 
        end
    end

    def new 
        @contact = Contact.new
    end

    def create 

        @contact = Contact.new(contact_params)

        if @contact.save 
            # session[:contact_id] = @contact.id
            # session[:app_id] = @contact.app.id
            redirect_to controller: "contacts", action: 'index'
        else 
            render :new
        end

    end

    def show 
        @app = App.find(params[:app_id])
        @contact = Contact.find(params[:id])
    end


    def edit 
        @app = App.find(params[:app_id])
        @contact = Contact.find_by(id: params[:id])
    end

    def update 
        @contact = Contact.find_by(id: params[:id])
        @contact.update(contact_params)
        redirect_to app_contacts_path(@contact.app)

    end

    def destroy
        @contact = contact.find(params[:id]).destroy
        redirect_to "/"
    end


    private

    def get_app
        @app =  App.find(params[:app_id])
    end

    def set_contacts 
        @contact = @app.contacts.find(params[:id])
    end
    

   
    def contact_params 
        params.require(:contact).permit(:name, :spent, :age, :email, :gender, :first_seen,  :last_visit, :region, :city, :country_code, :app_id, :user_id)
    end



end
