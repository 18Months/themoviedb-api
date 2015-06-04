module Tmdb
  class Collection < Struct

    def self.detail(id, filters={})
      result = Resource.new("/collection/#{id}", filters).run

      collection = self.new(result.except('parts'))
      collection.parts = result['parts'].map do |part|
        self.new(part)
      end

      collection
    end

    def self.backdrops(id, filters={})
      result = Resource.new("/collection/#{id}/images", filters).run

      result['backdrops'].map do |backdrop|
        self.new(backdrop)
      end
    end

    def self.posters(id, filters={})
      result = Resource.new("/collection/#{id}/images", filters).run

      result['posters'].map do |poster|
        self.new(poster)
      end
    end

  end
end
