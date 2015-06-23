require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Genre do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Genre }

  it { is_expected.to respond_to(:movie_list) }
  it { is_expected.to respond_to(:tv_list) }
  it { is_expected.to respond_to(:movies) }

  context '#movie_list' do
    let(:movie_list) do
      VCR.use_cassette 'genre/movie_list' do
        Tmdb::Genre.movie_list
      end
    end

    subject { movie_list }

    it 'should be an Array' do
      expect(subject).to be_an_instance_of(Array)
    end

    it 'should contain many Tmdb::Genre' do
      expect(subject.sample).to be_an_instance_of(Tmdb::Genre)
    end
  end

  context '#tv_list' do
    let(:tv_list) do
      VCR.use_cassette 'genre/tv_list' do
        Tmdb::Genre.tv_list
      end
    end

    subject { tv_list }

    it 'should be an Array' do
      expect(subject).to be_an_instance_of(Array)
    end

    it 'should contain many Tmdb::Genre' do
      expect(subject.sample).to be_an_instance_of(Tmdb::Genre)
    end
  end

  context '#movies' do
    let(:movies) do
      VCR.use_cassette 'genre/movies' do
        Tmdb::Genre.movies(18)
      end
    end

    subject { movies }

    it { expect(subject).to be_an_instance_of(Tmdb::Genre) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

end