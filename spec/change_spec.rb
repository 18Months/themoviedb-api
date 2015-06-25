require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Change do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Change }

  it { is_expected.to respond_to(:movie) }
  it { is_expected.to respond_to(:person) }
  it { is_expected.to respond_to(:tv) }

  context '#movie' do
    let(:movie) do
      VCR.use_cassette 'change/movie' do
        Tmdb::Change.movie
      end
    end

    subject { movie }

    it { expect(subject).to be_an_instance_of(Tmdb::Change) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#person' do
    let(:person) do
      VCR.use_cassette 'change/person' do
        Tmdb::Change.person
      end
    end

    subject { person }

    it { expect(subject).to be_an_instance_of(Tmdb::Change) }

    it 'should have results of kind Tmdb::Person' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Person)
    end
  end

  context '#tv' do
    let(:tv) do
      VCR.use_cassette 'change/tv' do
        Tmdb::Change.tv
      end
    end

    subject { tv }

    it { expect(subject).to be_an_instance_of(Tmdb::Change) }

    it 'should have results of kind Tmdb::TV' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

end
