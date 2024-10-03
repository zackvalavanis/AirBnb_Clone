class InformationController < ApplicationController

    require 'uri'
    require 'net/http'
  
    def fetch_and_store_data
      api_data = fetch_api_data
  
      if api_data.is_a?(Hash) && api_data['error']
        render json: { error: api_data['error'] }, status: :bad_request
        return
      end
  
      # Assuming the API returns an array of room data
      api_data.each do |data|
        Room.create_or_update_from_api(data) # Method to create or update rooms
      end
  
      render json: { message: 'Data successfully fetched and stored.' }, status: :ok
    end
  
    private
  
    def fetch_api_data
      url = URI("https://airbnb13.p.rapidapi.com/search-geo?ne_lat=52.51&ne_lng=13.41&sw_lat=52.41&sw_lng=13.31&checkin=2025-01-12&checkout=2025-01-13&adults=1&children=0&infants=0&pets=0&page=1&currency=USD")
  
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
  
      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = 'cf4cd8a72emsh14a4ad1be390511p11c5b8jsn8305a3638199'
      request["x-rapidapi-host"] = 'airbnb13.p.rapidapi.com'
  
      response = http.request(request)
  
      if response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.read_body) # Parse JSON response
      else
        { error: "#{response.code} - #{response.message}" }
      end
    end  
end
