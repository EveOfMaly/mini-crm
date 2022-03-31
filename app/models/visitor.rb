class Visitor < ApplicationRecord
    has_many :contacts_visitors
    has_many :contacts, through: :contacts_visitors
end
