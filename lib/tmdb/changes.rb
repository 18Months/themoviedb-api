module Tmdb
  class Changes < Struct

    def self.movie(filters={})
      result = Resource.new("/movie/changes", filters).run
      self.new(result)
    end

    def self.person(filters={})
      result = Resource.new("/person/changes", filters).run
      self.new(result)
    end

    def self.tv(filters={})
      result = Resource.new("/tv/changes", filters).run
      self.new(result)
    end

  end
end
