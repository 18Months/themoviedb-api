module Tmdb
  class Collection < Struct

    def self.detail(id, filters={})
      result = Resource.new("/collection/#{id}", filters).run
      self.new(result)
    end

    def self.images(id, filters={})
      result = Resource.new("/collection/#{id}/images", filters).run
      self.new(result)
    end

  end
end
