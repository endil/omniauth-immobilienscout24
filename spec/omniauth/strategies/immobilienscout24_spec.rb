require 'spec_helper'

describe 'OmniAuth::Strategies::ImmobilienScout24' do
  subject do
    OmniAuth::Strategies::ImmobilienScout24.new(nil, @options || {})
  end

  it 'should add a camelization for itself' do
    OmniAuth::Utils.camelize('immobilienscout24').should == 'ImmobilienScout24'
  end

  context 'client options' do
    it 'has correct site' do
      subject.options.client_options.site.should eq('https://rest.immobilienscout24.de/restapi')
    end

    it 'has correct request token path' do
      subject.options.client_options.request_token_path.should eq('/security/oauth/request_token')
    end

    it 'has correct access token path' do
      subject.options.client_options.access_token_path.should eq('/security/oauth/access_token')
    end
    
    it 'has correct authorize path' do
      subject.options.client_options.authorize_path.should eq('/security/oauth/confirm_access')
    end
  end

  context '#uid' do
    before :each do
      subject.stub(:raw_info) { { '@peid' => '123' } }
    end

    it 'returns the @peid from raw_info' do
      subject.uid.should eq('123')
    end
  end
  
  context '#info' do
    before :each do
      subject.stub(:raw_info) {
        {
          '@id' => '123',
          'contactDetails' => {
            'salutation' => 'MALE',
            'firstname' => 'John',
            'lastname' => 'Doe',
            'homepageUrl' => 'http://www.example.com/'
          }
        }
      }
    end

    it 'returns the @id from raw_info' do
      subject.info[:id].should eq('123')
    end
    
    it 'returns the salutation from contactDetails in raw_info' do
      subject.info[:salutation].should eq('MALE')
    end
    
    it 'returns the first_name from contactDetails in raw_info' do
      subject.info[:first_name].should eq('John')
    end
    
    it 'returns the last_name from contactDetails in raw_info' do
      subject.info[:last_name].should eq('Doe')
    end
    
    it 'returns the url from contactDetails in raw_info' do
      subject.info[:url].should eq('http://www.example.com/')
    end
  end
end