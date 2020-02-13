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

  def self.print_list
    self.all_locations.each.with_index(1) {|location, index|
      puts "#{index}. #{location.facility_name} at #{location.address} #{location.borough} #{location.borough}"
    }
  end

  def self.print_chosen_location(user_choice)
    x = self.all_locations[user_choice.to_i - 1]
    puts "#{x.facility_name} at #{x.address} #{x.borough}, NY #{x.zip_code}\nPhone number: #{x.phone}\nWalk-ins accepted? #{x.walk_in}\nChildren accepted? #{x.children}\nFor more information: #{x.more_information}"
  end
end
