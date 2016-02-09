module Tmdb
  class Search < Struct

    def self.company(query, filters={})
      filters.merge!(query: query)

      get_result = Resource.new('/search/company', filters).get

      result = Result.new(get_result.except('results'))
      result.results = get_result['results'].map do |movie|
        Company.new(movie)
      end

      result
    end

    def self.collection(query, filters={})
      filters.merge!(query: query)

      get_result = Resource.new('/search/collection', filters).get

      result = Result.new(get_result.except('results'))
      result.results = get_result['results'].map do |movie|
        Collection.new(movie)
      end

      result
    end

    def self.keyword(query, filters={})
      filters.merge!(query: query)

      get_result = Resource.new('/search/keyword', filters).get

      result = Result.new(get_result.except('results'))
      result.results = get_result['results'].map do |movie|
        Keyword.new(movie)
      end

      result
    end

    def self.list(query, filters={})
      filters.merge!(query: query)

      get_result = Resource.new('/search/list', filters).get

      result = Result.new(get_result.except('results'))
      result.results = get_result['results'].map do |movie|
        Tmdb::List.new(movie)
      end

      result
    end

    def self.movie(query, filters={})
      filters.merge!(query: query)

      get_result = Resource.new('/search/movie', filters).get

      result = Result.new(get_result.except('results'))
      result.results = get_result['results'].map do |movie|
        Movie.new(movie)
      end

      result
    end

    def self.multi(query, filters={})
      filters.merge!(query: query)

      get_result = Resource.new('/search/multi', filters).get

      result = Result.new(get_result.except('results'))
      result.results = get_result['results'].map do |movie|
        Multi.new(movie)
      end

      result
    end

    def self.person(query, filters={})
      filters.merge!(query: query)

      get_result = Resource.new('/search/person', filters).get

      result = Result.new(get_result.except('results'))
      result.results = get_result['results'].map do |movie|
        person = Person.new(movie)
        person.convert_known_for!
        person
      end

      result
    end

    def self.tv(query, filters={})
      filters.merge!(query: query)

      get_result = Resource.new('/search/tv', filters).get

      result = Result.new(get_result.except('results'))
      result.results = get_result['results'].map do |movie|
        TV.new(movie)
      end

      result
    end

  end
end
