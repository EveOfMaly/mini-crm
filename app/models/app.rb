class App < ApplicationRecord
    has_many :users
    has_many :visitors
    has_many :contacts
    has_many :pages
end
