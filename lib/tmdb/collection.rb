module Tmdb
  class Collection < Struct

    def self.detail(id, filters={})
      result = Resource.new("/collection/#{id}", filters).get

      collection = self.new(result.except('parts'))
      collection.parts = result['parts'].map do |part|
        Movie.new(part)
      end

      collection
    end

    def self.backdrops(id, filters={})
      result = Resource.new("/collection/#{id}/images", filters).get

      result['backdrops'].map do |backdrop|
        Backdrop.new(backdrop)
      end
    end

    def self.posters(id, filters={})
      result = Resource.new("/collection/#{id}/images", filters).get

      result['posters'].map do |poster|
        Poster.new(poster)
      end
    end

  end
end
