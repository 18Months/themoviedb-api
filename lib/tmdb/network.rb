module Tmdb
  class Network < Struct

    def self.detail(id, filters={})
      result = Resource.new("/network/#{id}", filters).run
      self.new(result)
    end

  end
end
