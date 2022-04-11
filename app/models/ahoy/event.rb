class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods
  after_create :create_visitor_object 
  self.table_name = "ahoy_events"

  belongs_to :visit
  belongs_to :user, optional: true

  def create_visitor_object 
    #find or create

    @visitor = Visitor.find_or_create_by(ahoy_visit_id: self.visit_id) do |visitor|

      visitor.name = "Anonomous " + Faker::Name.name
      visitor.first_seen = self.time.to_s
      visitor.ahoy_visit_id =  self.visit_id
      visitor.app_id = properties["app_id"].to_i
      @app = App.find(properties["app_id"])
      visitor.pages << @app.pages.find(properties["id"])
    end
  end

  serialize :properties, JSON
end