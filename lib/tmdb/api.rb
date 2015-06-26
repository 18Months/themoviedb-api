module Tmdb
  class Api
    include HTTParty

    VERSION = '3'
    base_uri 'http://api.themoviedb.org/3/'

    format :json

    headers 'Accept'       => 'application/json'
    headers 'Content-Type' => 'application/json'

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
