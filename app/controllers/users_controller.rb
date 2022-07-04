class UsersController < ApplicationController
    before_action :get_app, only: [:index, :show, :edit, :update, :destroy, :sorted_user]
    before_action :set_user, only:[:show, :edit, :update, :destroy, :sorted_user]

    before_action :require_login, only: [:index, :show]
   
   
  
    #admins are able to see a list of users that belong to the app 
    #all non-admins get redirected to home
    def index 
        if current_user.admin == true 
            @users = @app.users
        else 
            redirect_to "/"
        end
    end

    #landing page view with the goal of getting the email(lead). 
    #Possibly connect to email tool
    def welcome 
        @user = User.new
        render layout: 'welcome'
    end

    #form to create a new instance of a user 
    def welcome_create_lead
        @user = User.new(user_params)
        render layout: 'sign_in_form'
    end

    def new 
        @user = User.new(user_params)
    end

    def create 
        @user = User.new(user_params)
        @app = @user.build_app 
      
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            session[:app_id] = @user.app.id
            redirect_to controller: "contacts", action: 'index', app_id: @user.app.id
        else 
            flash[:message] = "Please input in a username, email, and password"
            redirect_to welcome_to_crm_path
        end

    end

    #action to view user profile
    def show 
        
    end
        

    def edit 

    end

    def update 
        @user.update(user_params)
       
        redirect_to controller: "contacts", action: 'index', app_id: @user.app.id
    end


    def destroy
        @user.destroy
        session.delete :user_id
        session.delete :app_id
        redirect_to "/"
    end



    def sorted_users
     
        @users = User.all
       
        render layout: false

    end

    private 

  

    def set_user 
        @user = @app.users.find(params[:id])
    end
    
    def user_params 
        params.require(:user).permit(:username, :email, :password, :app_id)
    end

  

end
