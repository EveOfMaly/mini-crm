class App < ApplicationRecord
    has_many :users
    has_many :contacts

    has_many :visitors

end
