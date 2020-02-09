class FluVaccination::CLI

  def call
    puts "Welcome to the Flu Vaccination CLI App! Protect yourself and others, get vaccinated!"
    puts "For a list of locations offering free vaccination against the flu near you enter your zip-code."
    zip_code = gets.chomp
    locations_filtered_by_zip(zip_code)
  end

  def locations_filtered_by_zip(zip_code)
    if FluVaccination::API.new.filtered_by_zip(zip_code).length == 0
      puts "No locations found in your area."
    else
      response = FluVaccination::API.new.filtered_by_zip(zip_code)

      response.each {|location|
        FluVaccination::FluVaccination.new(location)
      }
    end

    FluVaccination::FluVaccination.all_locations.each.with_index(1) {|location, index|
      puts "#{index}. #{location.facility_name} at #{location.address} #{location.borough} " + zip_code
    }
  end
#Call all_locations method to access properties of locations stored in @@all. Print numbered list of location's name and address given zip-code input, for users to choose from. 
end
