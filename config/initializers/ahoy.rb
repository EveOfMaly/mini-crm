class Ahoy::Store < Ahoy::DatabaseStore
  mattr_accessor :auto_mount
  self.auto_mount = false

  def geocode(data)
    super(data)
  end

  def track_visit(data)
    # new visit
    super(data)
  end

  def track_event(data)
    # new event
    super(data)
  end

  def geocode(data)
    # visit geocoded
    super(data)
  end

  def authenticate(data)
    # user authenticates
    super(data)
  end

end

# set to true for JavaScript tracking
Ahoy.api = true

# set to true for geocoding (and add the geocoder gem to your Gemfile)
# we recommend configuring local geocoding as well
# see https://github.com/ankane/ahoy#geocoding
Ahoy.geocode = true
mattr_accessor :auto_mount
self.auto_mount = false

Ahoy.job_queue = :low_priority

Ahoy.quiet = false
