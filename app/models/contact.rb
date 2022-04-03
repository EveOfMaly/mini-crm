class Contact < ApplicationRecord
    has_many :contacts_visitors
    has_many :visitors, through: :contacts_visitors
    has_many :identities
    has_many :visitors, through: :identities
    
    belongs_to :user
    belongs_to :app
end
