require 'httparty'
require 'yaml'

class HTTPClient
  include HTTParty

  def get(url, params = {})
    HTTParty.get(url, format: :plain)
  end
end

class DataStore
  def save(data)
    File.open('birdssongs.yml', 'w') do |file|
      file.write data.to_yaml
    end
  end
end

class BirdSong
  BASE_URL = 'http://www.xeno-canto.org/api/2/recordings'.freeze

  def fetch(bird:, country:, quality: :A)
    request_url = BASE_URL + "?query=#{bird}+cnt:#{country}+q:#{quality}"
    response = HTTPClient.new.get(request_url)
    parsed_data = JSON.parse response, symbolize_names: true

    DataStore.new.save(filtered_data(parsed_data[:recordings]))
  end

  def filtered_data(birds_data)
    result = []
    selected_keys = %i[gen sp ssp file]
    birds_data.each do |bird|
      result << bird.select do |key, value|
        selected_keys.include? key
      end
    end
    result
  end
end

BirdSong.new.fetch(bird: :nightingale, country: :russia)
