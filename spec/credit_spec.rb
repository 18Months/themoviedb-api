require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Credit do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Credit }

  it { is_expected.to respond_to(:detail) }

  context '#detail' do
    let(:detail) do
      VCR.use_cassette 'credit/detail' do
        Tmdb::Credit.detail('525333fb19c295794002c720')
      end
    end

    subject { detail }

    it { expect(subject).to be_an_instance_of(Tmdb::Credit) }

    it 'should have media of kind Tmdb::Media' do
      expect(subject.media).to be_an_instance_of(Tmdb::Media)
    end

    it 'should have media with episodes of kind Tmdb::Tv::Episode' do
      expect(subject.media.episodes.sample).to be_an_instance_of(Tmdb::Tv::Episode)
    end

    it 'should have media with seasons of kind Array' do
      expect(subject.media.seasons).to be_an_instance_of(Array)
    end

    it 'should have a person associated of kind Tmdb::Person' do
      expect(subject.person).to be_an_instance_of(Tmdb::Person)
    end
  end

end
