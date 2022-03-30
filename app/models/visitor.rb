class Visitor < ApplicationRecord
    has_many :contacts_distinct_ids
    has_many :distinct_ids, through: contacts_distinct_ids
end
