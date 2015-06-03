module Tmdb
  class Company < Struct

    def self.detail(id, filters={})
      result = Resource.new("/company/#{id}", filters).run
      self.new(result)
    end

    def self.movies(id, filters={})
      result = Resource.new("/company/#{id}/movies", filters).run
      self.new(result)
    end

  end
end
