module Tmdb
  class Search < Struct

    def self.company(query, filters={})
      filters.merge!(query: clean_query_param(query))

      result = Resource.new('/search/company', filters).get
      Company.new(result)
    end

    def self.collection(query, filters={})
      filters.merge!(query: clean_query_param(query))

      result = Resource.new('/search/collection', filters).get
      Collection.new(result)
    end

    def self.keyword(query, filters={})
      filters.merge!(query: clean_query_param(query))

      result = Resource.new('/search/keyword', filters).get
      Keyword.new(result)
    end

    def self.list(query, filters={})
      filters.merge!(query: clean_query_param(query))

      result = Resource.new('/search/list', filters).get
      Tmdb::List.new(result)
    end

    def self.movie(query, filters={})
      filters.merge!(query: clean_query_param(query))

      result = Resource.new('/search/movie', filters).get
      Movie.new(result)
    end

    def self.multi(query, filters={})
      filters.merge!(query: clean_query_param(query))

      result = Resource.new('/search/multi', filters).get
      Multi.new(result)
    end

    def self.person(query, filters={})
      filters.merge!(query: clean_query_param(query))

      result = Resource.new('/search/person', filters).get
      person = Person.new(result)

      person.convert_known_for!

      person
    end

    def self.tv(query, filters={})
      filters.merge!(query: clean_query_param(query))

      result = Resource.new('/search/tv', filters).get
      TV.new(result)
    end

    def self.clean_query_param(query)
      CGI.escape(query)
    end

    private_class_method :clean_query_param

  end
end
