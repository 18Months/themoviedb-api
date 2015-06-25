module Tmdb
  class Resource

    include Utils

    attr_reader :params, :query_url

    def initialize(query_url, filters={})
      @params = filters
      @query_url = query_url
    end

    def get
      options = Api.params.merge(@params)

      begin
        response = Api.get(@query_url, query: options)
      rescue Net::HTTP::Exception
        raise Tmdb::Error, 'Network Exception: TMDB API endpoint is not reachable.'
      end

      if has_errors?(response)
        raise Tmdb::Error, response['status_message']
      end

      response.to_h
    end

  end
end
