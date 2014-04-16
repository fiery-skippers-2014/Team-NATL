require 'json'

module Instagram
  class Client
    include HTTParty
    base_uri 'https://api.instagram.com/v1'


    def get_posts

       results = self.class.get("/tags/selfie/media/recent?client_id=e2e6cab7b5ce4ebab998468c796f81ef",
        :query => { limit: 1}
        )
       return parseForPhotos(results.body)
    end

    def parseForPhotos(results)
        raw = JSON.parse(results)
        results = raw['data']
        photo_hash = {}
        results.each do |insta|
        location = insta['location']
        image_url = insta['images']['standard_resolution']['url']
        if insta['caption']
         image_text = insta['caption']['text']
        else
          image_text = nil
        end
        if location == nil
          latitude = nil
          longitude = nil
        else
          latitude = location['latitude']
          longitude = location['longitude']
        end
        image_id = insta['id']
        photo_hash[image_id] = {image_url: image_url, image_text: image_text, insta_id: image_id, latitude: latitude, longitude: longitude}

      end
      add_to_database(photo_hash)
    end

    def add_to_database(photos)
      photos.each_with_index do |photo,index|
        # ap photo
        google = Google::Client.new
        city = google.get_address(photo[1][:latitude], photo[1][:longitude]) if photo[1][:latitude] != nil
        p city
        if Photo.find_by_insta_id(photo[0])
          p 'already exists'
        else
          # @photo = Photo.create(insta_id: photo[1][:insta_id], latitude: photo[1][:latitude], longitude: photo[1][:longitude], insta_text: photo[1][:image_text], url: photo[1][:image_url] )
        end
      end
    end


  end
end


# CLIENT INFO
# CLIENT ID e2e6cab7b5ce4ebab998468c796f81ef
# CLIENT SECRET a5e3c5e4a9bc4ed8a238a1b0dd1acef8
# WEBSITE URL http://127.0.0.1:9393/
# REDIRECT URI  http://127.0.0.1:9393/