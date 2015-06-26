require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Find do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Find }

  it { is_expected.to respond_to(:movie) }
  it { is_expected.to respond_to(:people) }
  it { is_expected.to respond_to(:tv_serie) }
  it { is_expected.to respond_to(:tv_season) }
  it { is_expected.to respond_to(:tv_episode) }

  context '#movie' do
    let(:movie) do
      VCR.use_cassette 'find/movie' do
        Tmdb::Find.movie('tt0266543', external_source: 'imdb_id')
      end
    end

    subject { movie }

    it 'should return an array of Tmdb::Movie' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#people' do
    let(:people) do
      VCR.use_cassette 'find/people' do
        Tmdb::Find.people('nm0298350', external_source: 'imdb_id')
      end
    end

    subject { people }

    it 'should return an array of Tmdb::Person' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Person)
    end

    it 'Tmdb::Person should contain known_for field with misc objects' do
      expect(subject.first.known_for).to be_an_instance_of(Array)
      expect(subject.first.known_for.first).to be_an_instance_of(Tmdb::TV)
    end
  end

  context '#tv_serie' do
    let(:tv_serie) do
      VCR.use_cassette 'find/tv_serie' do
        Tmdb::Find.tv_serie('tt3749900', external_source: 'imdb_id')
      end
    end

    subject { tv_serie }

    it 'should return an array of Tmdb::TV' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

  context '#tv_season' do
    let(:tv_season) do
      VCR.use_cassette 'find/tv_season' do
        Tmdb::Find.tv_season('121361', external_source: 'tvdb_id')
      end
    end

    subject { tv_season }

    it 'should return an array of Tmdb::TV' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

  context '#tv_episode' do
    let(:tv_episode) do
      VCR.use_cassette 'find/tv_episode' do
        Tmdb::Find.tv_episode('121361', external_source: 'tvdb_id')
      end
    end

    subject { tv_episode }

    it 'should return an array of Tmdb::TV' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

end
