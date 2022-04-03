class ContactVisitorJoin < ApplicationRecord
    belongs_to :contact
    belongs_to :visitor
end
