require 'omniauth/strategies/oauth'

module OmniAuth
  module Strategies
    class ImmobilienScout24 < OmniAuth::Strategies::OAuth

      args [:consumer_key, :consumer_secret]

      option :client_options, {
        :access_token_path => '/security/oauth/access_token',
        :authorize_path => '/security/oauth/confirm_access',
        :request_token_path => '/security/oauth/request_token',
        :site => 'https://rest.immobilienscout24.de/restapi',
      }

      info do
        {
          :id => raw_info['@id'],
          :salutation => raw_info['contactDetails']['salutation'],
          :first_name => raw_info['contactDetails']['firstname'],
          :last_name => raw_info['contactDetails']['lastname'],
          :url => raw_info['contactDetails']['homepageUrl']
        }
      end

      uid do
        raw_info['@peid']
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/api/search/v1.0/searcher/me', { 'Accept' => 'application/json' }).body)['searcher.searcher']
      end

    end
  end
end

OmniAuth.config.add_camelization 'immobilienscout24', 'ImmobilienScout24'