class Visitor < ApplicationRecord
    # has_many :contact_visitors
    # belongs_to :contacts, through: :contact_visitors
    
    # has_many :identities
    # has_many :contacts, through: :identities
    
    has_many :pages
    belongs_to :app_id

    visitable :ahoy_visit



end
