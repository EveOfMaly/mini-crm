class Contact < ApplicationRecord
    # has_many :contact_visitors
    # has_many :visitors, through: :contact_visitors
    has_many :identities
    has_many :visitors, through: :identities
    
    belongs_to :user
    belongs_to :app


    def identify

    end
end
