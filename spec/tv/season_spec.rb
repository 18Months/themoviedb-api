require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Tv::Season do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Tv::Season }

  it { is_expected.to respond_to(:detail) }
  it { is_expected.to respond_to(:changes) }
  it { is_expected.to respond_to(:cast) }
  it { is_expected.to respond_to(:crew) }
  it { is_expected.to respond_to(:external_ids) }
  it { is_expected.to respond_to(:posters) }
  it { is_expected.to respond_to(:videos) }

  context '#detail' do
    let(:detail) do
      VCR.use_cassette 'tv/season/detail' do
        Tmdb::Tv::Season.detail(3572, 1)
      end
    end

    subject { detail }

    it { expect(subject).to be_an_instance_of(Tmdb::Tv::Season) }

    it 'Tmdb::Tv::Season should contain episodes field with Tmdb::Tv::Episode objects' do
      expect(subject.episodes).to be_an_instance_of(Array)
      expect(subject.episodes.first).to be_an_instance_of(Tmdb::Tv::Episode)
    end

    it 'Tmdb::Tv::Episode should have crew field with Tmdb::Person objects' do
      expect(subject.episodes.first.crew).to be_an_instance_of(Array)
      expect(subject.episodes.first.crew.first).to be_an_instance_of(Tmdb::Person)
    end

    it 'Tmdb::Tv::Episode should have guest_stars field with Tmdb::Person objects' do
      expect(subject.episodes.first.guest_stars).to be_an_instance_of(Array)
      expect(subject.episodes.first.guest_stars.first).to be_an_instance_of(Tmdb::Person)
    end
  end

  context '#changes' do
    let(:changes) do
      VCR.use_cassette 'tv/season/changes' do
        Tmdb::Tv::Season.changes(59905, start_date: '2015-05-23', end_date: '2015-05-26')
      end
    end

    subject { changes }

    it 'should have changes of kind Tmdb::Change' do
      expect(subject.sample).to be_an_instance_of(Tmdb::Change)
    end

    it 'changes should contain items of kind Tmdb::ChangeItem' do
      expect(subject.first.items.first).to be_an_instance_of(Tmdb::ChangeItem)
    end
  end

  context '#cast' do
    let(:cast) do
      VCR.use_cassette 'tv/season/cast' do
        Tmdb::Tv::Season.cast(3572, 1)
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
      VCR.use_cassette 'tv/season/crew' do
        Tmdb::Tv::Season.crew(3572, 1)
      end
    end

    subject { crew }

    it 'should return an array of Tmdb::Person' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Person)
    end
  end

  context '#external_ids' do
    let(:external_ids) do
      VCR.use_cassette 'tv/season/external_ids' do
        Tmdb::Tv::Season.external_ids(3572, 1)
      end
    end

    subject { external_ids }

    it { expect(subject).to be_an_instance_of(Tmdb::Tv::Season) }
  end

  context '#posters' do
    let(:posters) do
      VCR.use_cassette 'tv/season/posters' do
        Tmdb::Tv::Season.posters(1399, 1)
      end
    end

    subject { posters }

    it 'should return an array of Tmdb::Poster' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Poster)
    end
  end

  context '#videos' do
    let(:videos) do
      VCR.use_cassette 'tv/season/videos' do
        Tmdb::Tv::Season.videos(1399, 1)
      end
    end

    subject { videos }

    it 'should return an array of Tmdb::Video' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Video)
    end
  end

end
