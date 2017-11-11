require "url2png/plus/version"
require "openssl"
require "uri"

module Url2png
  module Plus
    class Client
      attr_accessor :api_key, :secret, :scheme

      def initialize(api_key: ENV["URL2PNG_API_KEY"], secret: ENV["URL2PNG_SECRET"], scheme: "https")
        self.api_key = api_key
        self.secret = secret
        self.scheme = scheme
      end

      def url(url, **params)
        params[:url] = url
        query = URI.encode_www_form(params)
        token = OpenSSL::Digest::MD5.hexdigest(query + secret)
        URI.parse("//api.url2png.com/v6/#{api_key}/#{token}/png/?#{query}").tap do |url|
          url.scheme = @scheme
        end
      end
    end

    def self.client
      @_client ||= Client.new
    end

    def self.config
      yield client
    end

    module Helper
      def url2png_url(*args, **params)
        Url2png::Plus.client.url(*args, **params)
      end
    end
  end
end
