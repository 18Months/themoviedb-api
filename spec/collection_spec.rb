require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Collection do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Collection }

  it { is_expected.to respond_to(:detail) }
  it { is_expected.to respond_to(:backdrops) }
  it { is_expected.to respond_to(:posters) }

  context '#detail' do
    let(:detail) do
      VCR.use_cassette 'collection/detail' do
        Tmdb::Collection.detail(10)
      end
    end

    subject { detail }

    it { expect(subject).to be_an_instance_of(Tmdb::Collection) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.parts.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#backdrops' do
    let(:backdrops) do
      VCR.use_cassette 'collection/backdrops' do
        Tmdb::Collection.backdrops(10)
      end
    end

    subject { backdrops }

    it 'should return an array of Tmdb::Backdrop' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Backdrop)
    end
  end

  context '#posters' do
    let(:posters) do
      VCR.use_cassette 'collection/posters' do
        Tmdb::Collection.posters(10)
      end
    end

    subject { posters }

    it 'should return an array of Tmdb::Poster' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Poster)
    end
  end

end
