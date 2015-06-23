require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Movie do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Movie }

  it { is_expected.to respond_to(:detail) }
  it { is_expected.to respond_to(:alternative_titles) }
  it { is_expected.to respond_to(:cast) }
  it { is_expected.to respond_to(:crew) }
  it { is_expected.to respond_to(:director) }
  it { is_expected.to respond_to(:backdrops) }
  it { is_expected.to respond_to(:posters) }
  it { is_expected.to respond_to(:videos) }
  it { is_expected.to respond_to(:keywords) }
  it { is_expected.to respond_to(:releases) }
  it { is_expected.to respond_to(:translations) }
  it { is_expected.to respond_to(:similar) }
  it { is_expected.to respond_to(:reviews) }
  it { is_expected.to respond_to(:lists) }
  it { is_expected.to respond_to(:changes) }
  it { is_expected.to respond_to(:latest) }
  it { is_expected.to respond_to(:upcoming) }
  it { is_expected.to respond_to(:now_playing) }
  it { is_expected.to respond_to(:popular) }
  it { is_expected.to respond_to(:top_rated) }

  context '#detail' do
    let(:detail) do
      VCR.use_cassette 'movie/detail' do
        Tmdb::Movie.detail(550)
      end
    end

    subject { detail }

    it 'should return an Tmdb::Movie object' do
      expect(subject).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#alternative_titles' do
    let(:alternative_titles) do
      VCR.use_cassette 'movie/alternative_titles' do
        Tmdb::Movie.alternative_titles(550)
      end
    end

    subject { alternative_titles }

    it 'should return an array of Tmdb::Movie' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#cast' do
    let(:cast) do
      VCR.use_cassette 'movie/cast' do
        Tmdb::Movie.cast(550)
      end
    end

    subject { cast }

    it 'should return an array of Tmdb::Person' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Person)
    end
  end

  context '#crew' do
    let(:crew) do
      VCR.use_cassette 'movie/crew' do
        Tmdb::Movie.crew(550)
      end
    end

    subject { crew }

    it 'should return an array of Tmdb::Person' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Person)
    end
  end

  context '#director' do
    let(:director) do
      VCR.use_cassette 'movie/director' do
        Tmdb::Movie.director(550)
      end
    end

    subject { director }

    it 'should return an array of Tmdb::Person' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Person)
    end
  end

end
