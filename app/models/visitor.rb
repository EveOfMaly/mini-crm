class Visitor < ApplicationRecord
    has_many :identities
    has_many :contacts, through: :identities

    belongs_to :app, optional: true


    has_many :visits, class_name: "Ahoy::Visit"
    has_many :events, class_name: "Ahoy::Event"

    has_many :visitor_pages
    has_many :pages, through: :visitor_pages
end
