class Contact < ApplicationRecord
    has_many :contacts_visitors
    has_many :visitors, through: :contacts_visitors
    belongs_to :user
end
