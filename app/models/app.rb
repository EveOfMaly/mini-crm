class App < ApplicationRecord
    has_many :app_users
    has_many :users, through: :app_users
    has_many :contacts

    has_many :visitors
    has_many :pages
end
