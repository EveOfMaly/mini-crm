class Ahoy::Visit < ApplicationRecord

 

  self.table_name = "ahoy_visits"

  has_many :events, class_name: "Ahoy::Event"
  belongs_to :user, optional: true
  # belongs_to :app, optional: true
  # belongs_to :page, optional: true


  


end