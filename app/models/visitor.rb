class Visitor < ApplicationRecord
    has_many :contacts_visitors
    belongs_to :contacts, through: :contacts_visitors
    
    has_many :identities
    has_many :contacts, through: :identities
    
    has_many :pages
    belongs_to :app_id
end
