class FluVaccination::CLI

  def call
    puts "Welcome to the Flu Vaccination CLI App! Protect yourself and others, get vaccinated!"
    first_return
  end

  def first_return
    puts "For a list of locations providing seasonal flu vaccinations near you enter your zip-code:"
    zip_code = gets.chomp
    locations_filtered_by_zip(zip_code)
    chosen_location
  end

  def locations_filtered_by_zip(zip_code)
    while FluVaccination::API.new.filtered_by_zip(zip_code).length == 0
      puts "No locations found for that entry. Please try again:"
      zip_code = gets.chomp
    end
      locations = FluVaccination::API.new.filtered_by_zip(zip_code)
      FluVaccination::FluVaccination.create_from_api_response(locations)
      print_list
  end

  def chosen_location
    puts "Choose a location for more details. Enter exit to exit."
    user_choice = gets.chomp

    while user_choice.downcase != 'Exit'.downcase
      user_choice = user_choice.to_i
      if user_choice < 1 || user_choice > FluVaccination::FluVaccination.all_locations.length
        puts "Invalid choice. Try again."
      else
        print_chosen_location(user_choice)
        puts "Choose another location for more details or enter Exit to exit."
      end
      user_choice = gets.chomp
    end

  end

  def print_list
    FluVaccination::FluVaccination.all_locations.each.with_index(1) {|location, index|
      puts "#{index}. #{location.facility_name} at #{location.address} #{location.borough} #{location.borough}"
    }
  end

  def print_chosen_location(user_choice)
    x = FluVaccination::FluVaccination.all_locations[user_choice - 1]
    puts "#{x.facility_name} at #{x.address} #{x.borough}, NY #{x.zip_code}\nPhone number: #{x.phone}\nWalk-ins accepted? #{x.walk_in}\nChildren accepted? #{x.children}\nFor more information: #{x.more_information}"
  end

end
