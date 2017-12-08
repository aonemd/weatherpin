class GenerateRandomGeolocation
  attr_reader :latitude, :longitude

  def initialize; end

  def call
    @latitude  = Random.rand(-90..90)   # -90:90
    @longitude = Random.rand(-180..180) # -180:180
    self
  end
end
