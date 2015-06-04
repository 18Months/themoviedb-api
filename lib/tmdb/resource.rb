module Tmdb
  class Resource

    include Utils

    attr_reader :params, :query_url

    def initialize(query_url, filters={})
      @params = filters
      @query_url = query_url
    end

    def run
      options = Api.params.merge(@params)
      response = Api.get(@query_url, query: options)

      if has_errors?(response)
        raise Tmdb::Error, response['status_message']
      end

      response.to_h
    end

  end
end
