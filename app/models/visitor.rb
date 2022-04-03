class Visitor < ApplicationRecord
    has_many :contacts_visitors
    has_many :pages
    belongs_to :contacts, through: :contacts_visitors
    belongs_to :app
end
