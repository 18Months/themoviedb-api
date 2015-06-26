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
      VCR.use_cassette 'review/detail' do
        Tmdb::Review.detail('5013bc76760ee372cb00253e')
      end
    end

    subject { detail }

    it { expect(subject).to be_an_instance_of(Tmdb::Review) }
  end

end
