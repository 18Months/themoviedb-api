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

      begin
        response = RestClient.get Api::BASE_URI + query_url,
                                  Api::JSON_HEADERS.merge(params: request_params)
      rescue => e
        parsed_exception_rs = parse_json(e.response)

        if parsed_exception_rs['status_message'].present?
          raise Tmdb::Error, parsed_exception_rs['status_message']
        else
          raise Tmdb::Error, e.response
        end
      end

      parse_json(response)
    end

  end
end
