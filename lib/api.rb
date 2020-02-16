class FluVaccination::API

  BASE_URL = "https://data.cityofnewyork.us/resource/w9ei-idxz.json?service_category=Vaccines&service_type=Flu%20Vaccine%20(Influenza)" #a way to prefilter data by query parameters as specified in the API Docs

  def filtered_by_zip(zip_code)
    HTTParty.get(BASE_URL + "&zip_code=#{zip_code}")#reads api response and converts the JSON response to a Ruby hash object
  end

end
