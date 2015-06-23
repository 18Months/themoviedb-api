require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Keyword do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Keyword }

  it { is_expected.to respond_to(:detail) }
  it { is_expected.to respond_to(:movies) }

  context '#detail' do
    let(:detail) do
      VCR.use_cassette 'keyword/detail' do
        Tmdb::Keyword.detail(1721)
      end
    end

    subject { detail }

    it 'should generate a Tmdb::Keyword object' do
      expect(subject).to be_an_instance_of(Tmdb::Keyword)
    end
  end

  context '#movies' do
    let(:keyword_movies) do
      VCR.use_cassette 'keyword/movies' do
        Tmdb::Keyword.movies(1721)
      end
    end

    subject { keyword_movies }

    it { expect(subject).to be_an_instance_of(Tmdb::Keyword) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

end