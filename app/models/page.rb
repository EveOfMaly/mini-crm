class Page < ApplicationRecord
    belongs_to :user
    belongs_to :app
    has_many :visitor_pages
    has_many :visitors, through: :visitor_pages

   
    has_many :ahoy_visits, class_name: "Ahoy::Visit"
    has_many :ahoy_events, class_name: "Ahoy::Event"

    validates :title, presence: true
end
