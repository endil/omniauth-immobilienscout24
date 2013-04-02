# Omniauth ImmobilienScout24

This gem contains the [ImmobilienScout24](http://www.immobilienscout24.de/) strategy for [OmniAuth](https://github.com/intridea/omniauth/).

ImmobilienScout24 uses [OAuth 1.0a](http://oauth.net/core/1.0a/). For information on the implementation details check out the [documentation](http://developerwiki.immobilienscout24.de/wiki/Authentication).

## Preparation

1. Contact the [ImmobilienScout24 API team](http://developer.immobilienscout24.de/rest-api/rest-api-zugang/) to obtain your CONSUMER_KEY and CONSUMER_SECRET.
2. Make sure that you have already installed [OmniAuth](https://github.com/intridea/omniauth/wiki) into your application. Otherwise check out the [installation details](https://github.com/intridea/omniauth), the [documentation](https://github.com/intridea/omniauth/wiki) or follow this excellent [screencast](http://railscasts.com/episodes/241-simple-omniauth-revised) by [Ryan Bates](http://railscasts.com/about).

## Installation

First add the following line to your application's Gemfile:

```ruby
gem 'omniauth-immobilienscout24'
```

Execute the ```bundle``` command to install the gem.

Next, tell OmniAuth about the ImmobilienScout24 provider. For a Ruby on Rails application, your ```config/initializers/omniauth.rb``` file should look like:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :immobilienscout24, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end
```

Replace CONSUMER_KEY and CONSUMER_SECRET with the values given from the ImmobilienScout24 API team. And also make sure, that __the values are kept secret__!

After restarting your application, point the authenticating user to ```/auth/immobilienscout24```, the rest will be handled by OmniAuth.

## Authentication hash

Here's an example authentication hash available in ```request.env['omniauth.auth']```:

```ruby
{
  :provider => 'immobilienscout24',
  :uid => '1234',
  :info => {
    :id => '5678',
    :salutation => 'MALE',
    :name => 'ABC XYZ'
    :first_name => 'ABC'
    :last_name => 'XYZ'
    :url => 'http://www.example.com',
  },
  :credentials => {
    :token => '123ABC...', # OAuth access_token, which you may want to store
    :secret => 'abc123...' # OAuth access_secret, which you may want to store
  },
  :extra => {
    :raw_info => {
      ... # data from /api/search/v1.0/searcher/me
    }
  }
}
```

## Supported Rubies
[![Build Status](https://travis-ci.org/endil/omniauth-immobilienscout24.png?branch=master)](https://travis-ci.org/endil/omniauth-immobilienscout24)
[![Gem Version](https://badge.fury.io/rb/omniauth-immobilienscout24.png)](https://badge.fury.io/rb/omniauth-immobilienscout24)
[![Code Climate](https://codeclimate.com/github/endil/omniauth-immobilienscout24.png)](https://codeclimate.com/github/endil/omniauth-immobilienscout24)

OmniAuth ImmobilienScout24 is tested under 1.8.7, 1.9.2, 1.9.3 and Ruby Enterprise Edition.


## License

(The MIT License)

Copyright (c) 2013 by Niels Richter

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
