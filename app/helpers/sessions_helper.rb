module SessionsHelper
    def logged_in?
        !!session[:user_id]
    end
 
    def current_user
         @user = User.find_by(id: session[:user_id])
    end

    def set_visitor_id
        binding.pry
        session[:visit_id] = self.visit_id
    end

end
