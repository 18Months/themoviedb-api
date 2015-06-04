module Tmdb
  class Job < Struct

    def self.list(filters={})
      result = Resource.new('/job/list', filters).get

      result['jobs'].map do |job|
        self.new(job)
      end
    end

  end
end
