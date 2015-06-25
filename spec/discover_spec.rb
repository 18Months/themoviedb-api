require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Discover do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Discover }

  it { is_expected.to respond_to(:movie) }
  it { is_expected.to respond_to(:tv) }

  context '#movie' do
    let(:movie) do
      VCR.use_cassette 'discover/movie' do
        Tmdb::Discover.movie
      end
    end

    subject { movie }

    it { expect(subject).to be_an_instance_of(Tmdb::Discover) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#tv' do
    let(:tv) do
      VCR.use_cassette 'discover/tv' do
        Tmdb::Discover.tv
      end
    end

    subject { tv }

    it { expect(subject).to be_an_instance_of(Tmdb::Discover) }

    it 'should have results of kind Tmdb::TV' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

end
