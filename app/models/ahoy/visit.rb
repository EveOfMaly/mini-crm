class Ahoy::Visit < ApplicationRecord
  after_create :create_visitor_object 
  self.table_name = "ahoy_events"

  has_many :events, class_name: "Ahoy::Event"
  belongs_to :user, optional: true

  def create_visitor_object 
     
    @visitor = Visitor.find_or_create_by(ahoy_visit_id: self.id) do |visitor|
      visitor.name = "Anonomous Visitor " + Faker::Name.name
      visitor.first_seen = self.time.to_s
      visitor.ahoy_visit_id =  self.id
      visitor.app_id = properties["app_id"].to_i
      @app = App.find(properties["app_id"])
      visitor.pages << @app.pages.find(properties["id"])
    end
  end


end
