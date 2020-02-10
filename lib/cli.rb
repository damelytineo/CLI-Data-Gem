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

    puts "Choose a location for more details."
    
    user_choice = gets.chomp

    chosen_location = FluVaccination::FluVaccination.all_locations[user_choice.to_i - 1]
    puts "#{chosen_location.facility_name}, #{chosen_location.address} #{chosen_location.borough} NY #{chosen_location.zip_code}, #{chosen_location.phone}, Walk-ins accepted? #{chosen_location.walk_in}, Children? #{chosen_location.children}, #{chosen_location.more_information}"
  end

end
#Prompt user to select a location. Assign choice (num) to variable. Use variable to access location corresponding to choice. Puts location's full information.
