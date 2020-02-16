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

  def self.create_from_api_response(locations)
    locations.each {|location|
      self.new(location)
    }
  end

end
