class User < ApplicationRecord
    has_secure_password
    has_many :visitors
    has_many :contacts
    has_many :pages 

    def self.from_omniauth(response)
  
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end






    def user_params
        params.require(:user).permit(:username, :password, :email, :uid, :provider)
    end
end
