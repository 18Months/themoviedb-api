require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Tv::Episode do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Tv::Episode }

  it { is_expected.to respond_to(:detail) }
  it { is_expected.to respond_to(:changes) }
  it { is_expected.to respond_to(:cast) }
  it { is_expected.to respond_to(:crew) }
  it { is_expected.to respond_to(:guest_stars) }
  it { is_expected.to respond_to(:external_ids) }
  it { is_expected.to respond_to(:posters) }
  it { is_expected.to respond_to(:videos) }

  context '#detail' do
    let(:detail) do
      VCR.use_cassette 'tv/episode/detail' do
        Tmdb::Tv::Episode.detail(3572, 1, 1)
      end
    end

    subject { detail }

    it { expect(subject).to be_an_instance_of(Tmdb::Tv::Episode) }

    it 'Tmdb::Tv::Episode should contain crew field with Tmdb::Person objects' do
      expect(subject.crew).to be_an_instance_of(Array)
      expect(subject.crew.first).to be_an_instance_of(Tmdb::Person)
    end

    it 'Tmdb::Tv::Episode should contain guest_stars field with Tmdb::Person objects' do
      expect(subject.guest_stars).to be_an_instance_of(Array)
      expect(subject.guest_stars.first).to be_an_instance_of(Tmdb::Person)
    end
  end

  context '#changes' do
    let(:changes) do
      VCR.use_cassette 'tv/episode/changes' do
        Tmdb::Tv::Episode.changes(63065, start_date: '2015-06-15', end_date: '2015-06-20')
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
      VCR.use_cassette 'tv/episode/cast' do
        Tmdb::Tv::Episode.cast(3572, 1, 1)
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
      VCR.use_cassette 'tv/episode/crew' do
        Tmdb::Tv::Episode.crew(3572, 1, 1)
      end
    end

    subject { crew }

    it 'should return an array of Tmdb::Person' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Person)
    end
  end

  context '#guest_stars' do
    let(:guest_stars) do
      VCR.use_cassette 'tv/episode/guest_stars' do
        Tmdb::Tv::Episode.guest_stars(3572, 1, 1)
      end
    end

    subject { guest_stars }

    it 'should return an array of Tmdb::Person' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Person)
    end
  end

  context '#external_ids' do
    let(:external_ids) do
      VCR.use_cassette 'tv/episode/external_ids' do
        Tmdb::Tv::Episode.external_ids(3572, 1, 1)
      end
    end

    subject { external_ids }

    it { expect(subject).to be_an_instance_of(Tmdb::Tv::Episode) }
  end

  context '#posters' do
    let(:posters) do
      VCR.use_cassette 'tv/episode/posters' do
        Tmdb::Tv::Episode.posters(1399, 1, 1)
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
      VCR.use_cassette 'tv/episode/videos' do
        Tmdb::Tv::Episode.videos(1399, 1, 1)
      end
    end

    subject { videos }

    it 'should return an array' do
      expect(subject).to be_an_instance_of(Array)
    end
  end

end
