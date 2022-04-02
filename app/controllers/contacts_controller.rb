class ContactsController < ApplicationController

    def index 
        if params[:app_id]
            @app = App.find(params[:app_id])
            @contacts = @app.contacts
            
        else 
            @contacts = Contact.all 
        end
    end

    def new 
        @app = App.find(params[:app_id])
        @contacts = Contact.new
    end

    def create 
        @app = App.find(params[:app_id])
        
        contact = Contact.find(params[:id])
        
        @contact = Contact.new(contact_params)

        if @contact.save 
            # session[:contact_id] = @contact.id
            # session[:app_id] = @contact.app.id
            redirect_to app_contacts_path(@contact.app)
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

   
    def contact_params 
        params.require(:contact).permit(:name, :age, :email, :gender, :last_visit, :region, :city, :country_code)
    end

end
