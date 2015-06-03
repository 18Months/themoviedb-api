module Tmdb
  class Certification < Struct

    def self.movie_list(filters={})
      output = {}
      result = Resource.new('/certification/movie/list', filters).run

      result['certifications'].map do |nation, certification_list|
        output[nation.to_sym] = certification_list.map { |cert| self.new(cert) }
      end

      output
    end

    def self.tv_list(filters={})
      output = {}
      result = Resource.new('/certification/tv/list', filters).run

      result['certifications'].map do |nation, certification_list|
        output[nation.to_sym] = certification_list.map { |cert| self.new(cert) }
      end

      output
    end

  end
end
