class FluVaccination::FluVaccination
	attr_accessor :facility_name, :address, :borough, :zip_code, :phone, :walk_in, :children, :more_information

	@@all = [] #array of hashes

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
