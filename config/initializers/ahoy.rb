class Ahoy::Store < Ahoy::DatabaseStore
  mattr_accessor :auto_mount
  self.auto_mount = false

  def track_visit(data)
    # new visit
  end

  def track_event(data)
    # new event
  end

  def geocode(data)
    # visit geocoded
  end

  def authenticate(data)
    # user authenticates
  end
end

# set to true for JavaScript tracking
Ahoy.api = true

# set to true for geocoding (and add the geocoder gem to your Gemfile)
# we recommend configuring local geocoding as well
# see https://github.com/ankane/ahoy#geocoding
Ahoy.geocode = true
Ahoy.job_queue = :low_priority
Ahoy.quiet = false
