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
      locations = FluVaccination::API.new.filtered_by_zip(zip_code)
      FluVaccination::FluVaccination.create_from_api_response(locations)
    end

    FluVaccination::FluVaccination.print_list

    final_location
  end

  def final_location
    puts "Choose a location for more details."

    user_choice = gets.chomp

    FluVaccination::FluVaccination.print_chosen_location(user_choice)
  end

end
