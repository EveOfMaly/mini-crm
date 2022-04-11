class Contact < ApplicationRecord
    has_many :identities
    has_many :visitors, through: :identities
    
    belongs_to :user, optional: true
    belongs_to :app

    validates :email, presence: true

    scope :visitor_token_present, -> {where(visitor_token: true)}

end
