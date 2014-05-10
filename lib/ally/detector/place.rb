require 'ally/detector'
require 'ally/detector/place/version'

module Ally
  module Detector
    class Place
      include Ally::Detector

      require 'net/http'
      require 'uri'
      require 'json'

      attr_accessor :places
    
      def initialize(inquiry = nil)
        super # do not delete
        @key = @settings[:apikey] if @settings.key?(:apikey)
      end

      def detect
        search_str = @inquiry.raw
        words = @inquiry.type_of(:words).map(&:downcase)
        search_str = words[(words.index('at')+1)..-1].join(' ') if words.include?('at')
        search_str = words[(words.index('in')+1)..-1].join(' ') if words.include?('in')
        return nil if search_str.length == 0
        results = api_request(search_str)
        unless results.nil?
          @data_detected = true
          @places = results
        end
      end

      def api_request(query)
        base_url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?'
        params = URI.encode_www_form(query: query, key: @key, sensor: false)
        uri = URI.parse(base_url + params)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)
        if response.code.to_i == 200
          resp = JSON.parse(response.body)
          if resp['status'] == 'OK'
            resp['results']
          else
            # TODO: Handle error
          end
        else
          # TODO: handle error
        end
      end
 
    end
  end
end
