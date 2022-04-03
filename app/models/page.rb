class Page < ApplicationRecord
    belongs_to :user
    belongs_to :app
    has_many :visitors
end
