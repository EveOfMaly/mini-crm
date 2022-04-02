class ContactsController < ApplicationController

    def index 
        binding.pry
        if params[:app_id]
            @contacts =
        else 
            @contacts =
        end
    end

    def new 

    end

    def show 

    end

    def create 

    end


    def edit 

    end

    def update 

    end

    def destroy
    end

   
    def contact_params 
        params.require(:user).permit(:name, :age, :email, :gender, :last_visit, :region, :city, :country_code)
    end

end
