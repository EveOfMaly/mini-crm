class Page < ApplicationRecord
    belongs_to :user
    belongs_to :app
    has_many :visitors

    # visitable :ahoy_visit

    # has_many :visits, class_name: "Ahoy::Visit"
    has_many :ahoy_visits, class_name: "Ahoy::Visit"
    has_many :ahoy_events, class_name: "Ahoy::Event"
end
