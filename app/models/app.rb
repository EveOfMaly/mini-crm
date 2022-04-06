class App < ApplicationRecord
    has_many :users
    has_many :contacts

    has_many :visitors
    has_many :pages

    # visitable :ahoy_visit

    # has_many :visits, class_name: "Ahoy::Visit"
    has_many :ahoy_visits, class_name: "Ahoy::Visit"
    has_many :ahoy_events, class_name: "Ahoy::Event"
end
