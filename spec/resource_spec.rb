require 'rspec'
require 'spec_helper'

describe Tmdb::Resource do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  let(:resource) { Tmdb::Resource.new('/configuration', {}) }
  let(:configuration_resource) {
    VCR.use_cassette 'resource/configuration_get' do
      subject.get
    end
  }

  subject { resource }

  it { is_expected.to respond_to(:get) }

  context 'attribute readers' do
    it 'param should be an Hash' do
      expect(subject.params).to be_an_instance_of(Hash)
    end

    it 'query_url should be a String' do
      expect(subject.query_url).to be_an_instance_of(String)
    end

    it 'query_url should be equal to "/configuration"' do
      expect(subject.query_url).to eq('/configuration')
    end
  end

  context 'object methods' do
    it 'expect #get method to return a hash' do
      expect(configuration_resource).to be_an_instance_of(Hash)
    end
  end

end
