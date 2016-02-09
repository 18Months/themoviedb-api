module Tmdb
  class Resource

    include Utils

    attr_reader :params, :query_url

    def initialize(query_url, filters={})
      @params = filters
      @query_url = query_url
    end

    def get
      request_params = Api.params.merge(@params)

      response = RestClient.get Api::BASE_URI + query_url,
                                Api::JSON_HEADERS.merge(
                                    params: request_params
                                )

      JSON.parse(response.body)
    end

  end
end
