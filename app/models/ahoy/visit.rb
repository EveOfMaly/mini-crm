class Ahoy::Visit < ApplicationRecord
  self.table_name = "ahoy_visits"
  after_create :create_visitor_object 
  
  has_many :events, class_name: "Ahoy::Event"
  belongs_to :user, optional: true

  def create_visitor_object 

    @visitor = Visitor.find_or_create_by(ahoy_visit_id: self.id) do |visitor|
      visitor.name = "Anonomous Visitor " + Faker::Name.name
      visitor.first_seen = self.started_at
      visitor.ahoy_visit_id =  self.id
      app_id = self.landing_page.match(/\d+$/).to_s.to_i
      visitor.app_id = app_id
      @app = App.find(app_id)
      visitor.pages << @app.pages.find(app_id)
    end
  end


end
