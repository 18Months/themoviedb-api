module Tmdb
  class Review < Struct

    def self.detail(keyword_id, filters={})
      result = Resource.new("/review/#{keyword_id}", filters).get
      self.new(result)
    end

  end
end
