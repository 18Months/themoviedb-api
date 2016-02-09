module Tmdb
  class Api

    VERSION  = '3'
    BASE_URI = "http://api.themoviedb.org/#{VERSION}"

    JSON_HEADERS = {
        content_type: 'application/json; charset=utf-8',
        accept:       'application/json'
    }

    def self.params
      @@params ||= {}
    end

    def self.key(api_key)
      self.params[:api_key] = api_key
    end

    def self.language(lang)
      self.params[:language] = lang
    end

  end
end
