require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Network do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Network }

  it { is_expected.to respond_to(:detail) }

  context '#detail' do
    let(:detail) do
      VCR.use_cassette 'network/detail' do
        Tmdb::Network.detail(1)
      end
    end

    subject { detail }

    it { expect(subject).to be_an_instance_of(Tmdb::Network) }
  end

end
