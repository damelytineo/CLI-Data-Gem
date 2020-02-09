class FluVaccination::FluVaccination
  attr_accessor :facility_name, :address, :borough, :zip_code, :phone, :walk_in, :children, :more_information

  @@all = []

  def initialize(location)
    location.each {|key, value|
      begin
        self.send(("#{key}="), value)
      rescue NoMethodError
      end
    }
    @@all << self
  end

  def self.all_locations
    @@all
  end

end
#Turn API call data into instances of FluVaccination class. Mass assign data (hash of key-value pairs) to defined instance variables. Call NoMethodError if instance var is not defined. Store in class var @@all for later use in CLI - access this info via all_locations method.
