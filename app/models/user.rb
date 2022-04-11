class User < ApplicationRecord
    has_secure_password
    belongs_to :app
    has_many :contacts
    
    has_many :visitors
   
    has_many :pages 

    has_many :visits, class_name: "Ahoy::Visit"
    has_many :events, class_name: "Ahoy::Event"

    validates :username, :password, :email, presence: true


    #Authenticate using Google 
    def self.from_omniauth(response)
        @user = User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
            u.app = u.build_app
        end
  
    end


    private


    def user_params
        params.require(:user).permit(:username, :password, :email, :uid, :provider)
    end
end
