class Visitor < ApplicationRecord
    has_many :contacts_visitors
    has_many :contacts, through: :contacts_visitors
    belongs_to :app
end
