module Tmdb
  class Certification < Struct

    def self.list(filters={})
      output = {}
      result = Resource.new('/certification/movie/list', filters).run

      result['certifications'].map do |nation,certification_list|
        output[nation.to_sym] = certification_list.map { |cert| self.new(cert) }
      end

      output
    end

  end
end