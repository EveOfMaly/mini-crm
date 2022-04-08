class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods
  after_create :create_visitor_object 

  self.table_name = "ahoy_events"

  belongs_to :visit
  belongs_to :user, optional: true
  # belongs_to :app, optional: true
  # belongs_to :page, optional: true
  # belongs_to :page, optional: true

   #link ahoy visitor to visitor
  def create_visitor_object 
    @visitor = Visitor.new(name: "Anonomous " + Faker::Name.name, first_seen: self.time.to_s,ahoy_visit_id: self.visit_id, app_id:properties["app_id"].to_i) 
    @page_id = self.properties["id"]
    @visitor.pages << Page.find(@page_id)
    @visitor.save
  end

  serialize :properties, JSON
end