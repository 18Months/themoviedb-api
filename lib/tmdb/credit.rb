module Tmdb
  class Credit < Struct

    def self.detail(id, filters={})
      result = Resource.new("/credit/#{id}", filters).run
      self.new(result)
    end

  end
end
