require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Company do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Company }

  it { is_expected.to respond_to(:detail) }
  it { is_expected.to respond_to(:movies) }

  context '#detail' do
    let(:detail) do
      VCR.use_cassette 'company/detail' do
        Tmdb::Company.detail(1)
      end
    end

    subject { detail }

    it { expect(subject).to be_an_instance_of(Tmdb::Company) }
  end

  context '#movies' do
    let(:movies) do
      VCR.use_cassette 'company/movies' do
        Tmdb::Company.movies(1)
      end
    end

    subject { movies }

    it { expect(subject).to be_an_instance_of(Tmdb::Company) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

end
