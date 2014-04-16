require 'json'

module Google
  class Client
    include HTTParty
    base_uri 'https://maps.googleapis.com/maps/api/geocode/json?'


    def get_address(latitude, longitude)

       results = self.class.get("latlng=#{latitude},#{longitude}&sensor=false&key=AIzaSyCgfI0P9Zt4snDi9O02Vq2TSbZJCNsaZB4",
        :query => { limit: 1}
        )
       return parseForCity(results.body)
    end

    def parseForCity(results)
        raw = JSON.parse(results)
        ap results = raw['results'][0]['address_components'][3]['long_name']
        # ap raw
    end




  end
end


# CLIENT INFO
# CLIENT ID e2e6cab7b5ce4ebab998468c796f81ef
# CLIENT SECRET a5e3c5e4a9bc4ed8a238a1b0dd1acef8
# WEBSITE URL http://127.0.0.1:9393/
# REDIRECT URI  http://127.0.0.1:9393/https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&sensor=false&key=AIzaSyCgfI0P9Zt4snDi9O02Vq2TSbZJCNsaZB4