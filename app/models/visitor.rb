class Visitor < ApplicationRecord
    # has_many :contact_visitors
    # belongs_to :contacts, through: :contact_visitors
    
    has_many :identities
    has_many :contacts, through: :identities
    
    # has_many :pages
    belongs_to :app, optional: true
    # belongs_to :ahoy_visit_id

    # visitable :ahoy_visit

    has_many :visits, class_name: "Ahoy::Visit"
    has_many :events, class_name: "Ahoy::Event"

    has_many :visitor_pages
    has_many :pages, through: :visitor_pages

    # def convert_ahoy_visit_to_anon_visit
    #     binding.pry
    #     Ahoy::Event.all.where_event("Ran action", app_id: "1")

    # end



end
