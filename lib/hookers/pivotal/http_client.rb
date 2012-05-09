require 'net/http'
require 'uri'

module Hookers
  module Pivotal
    module HttpClient
      extend self

      def post(url, body, headers)
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host)
        request = Net::HTTP::Post.new(uri.request_uri)

        request.body = body
        request.initialize_http_header headers

        http.request(request)
      end
    end
  end
end