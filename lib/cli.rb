class FluVaccination::CLI

  def call
    puts "Welcome to the Flu Vaccination CLI App! Protect yourself and others, get vaccinated!"
    puts "For a list of locations offering free vaccination against the flu near you enter your zip-code."
    zip_code = gets.chomp
    locations_filtered_by_zip(zip_code)
  end

  def locations_filtered_by_zip(zip_code)
    response = FluVaccination::API.new.filtered_by_zip(zip_code)
  end

end
