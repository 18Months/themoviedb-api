module Tmdb
  class Job < Struct

    def self.list(filters={})
      result = Resource.new('/job/list', filters).run

      result['jobs'].map do |genre|
        self.new(genre)
      end
    end

  end
end