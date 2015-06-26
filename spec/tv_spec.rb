require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::TV do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::TV }

  it { is_expected.to respond_to(:detail) }
  it { is_expected.to respond_to(:alternative_titles) }
  it { is_expected.to respond_to(:changes) }
  it { is_expected.to respond_to(:content_ratings) }
  it { is_expected.to respond_to(:cast) }
  it { is_expected.to respond_to(:crew) }
  it { is_expected.to respond_to(:external_ids) }
  it { is_expected.to respond_to(:backdrops) }
  it { is_expected.to respond_to(:posters) }
  it { is_expected.to respond_to(:keywords) }
  it { is_expected.to respond_to(:similar) }
  it { is_expected.to respond_to(:translations) }
  it { is_expected.to respond_to(:videos) }
  it { is_expected.to respond_to(:latest) }
  it { is_expected.to respond_to(:on_the_air) }
  it { is_expected.to respond_to(:airing_today) }
  it { is_expected.to respond_to(:top_rated) }
  it { is_expected.to respond_to(:popular) }

  context '#detail' do
    let(:detail) do
      VCR.use_cassette 'tv/detail' do
        Tmdb::TV.detail(1396)
      end
    end

    subject { detail }

    it { expect(subject).to be_an_instance_of(Tmdb::TV) }

    it 'Tmdb::TV should contain created_by field with Tmdb::Person objects' do
      expect(subject.created_by).to be_an_instance_of(Array)
      expect(subject.created_by.first).to be_an_instance_of(Tmdb::Person)
    end

    it 'Tmdb::TV should contain networks field with Tmdb::Network objects' do
      expect(subject.networks).to be_an_instance_of(Array)
      expect(subject.networks.first).to be_an_instance_of(Tmdb::Network)
    end

    it 'Tmdb::TV should contain seasons field with Tmdb::Tv::Season objects' do
      expect(subject.seasons).to be_an_instance_of(Array)
      expect(subject.seasons.first).to be_an_instance_of(Tmdb::Tv::Season)
    end

    it 'Tmdb::TV should contain genres field with Tmdb::Genre objects' do
      expect(subject.genres).to be_an_instance_of(Array)
      expect(subject.genres.first).to be_an_instance_of(Tmdb::Genre)
    end

    it 'Tmdb::TV should contain production_companies field with Tmdb::Company objects' do
      expect(subject.production_companies).to be_an_instance_of(Array)
      expect(subject.production_companies.first).to be_an_instance_of(Tmdb::Company)
    end
  end

  context '#alternative_titles' do
    let(:alternative_titles) do
      VCR.use_cassette 'tv/alternative_titles' do
        Tmdb::TV.alternative_titles(1396)
      end
    end

    subject { alternative_titles }

    it 'should return an array of Tmdb::TV' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

  context '#changes' do
    let(:changes) do
      VCR.use_cassette 'tv/changes' do
        Tmdb::TV.changes(1399, start_date: '2015-06-23', end_date: '2015-06-26')
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

  context '#content_ratings' do
    let(:content_ratings) do
      VCR.use_cassette 'tv/content_ratings' do
        Tmdb::TV.content_ratings(1396)
      end
    end

    subject { content_ratings }

    it 'should return an array of Tmdb::Rating' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Rating)
    end
  end

  context '#cast' do
    let(:cast) do
      VCR.use_cassette 'tv/cast' do
        Tmdb::TV.cast(1396)
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
      VCR.use_cassette 'tv/crew' do
        Tmdb::TV.crew(1396)
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
      VCR.use_cassette 'tv/external_ids' do
        Tmdb::TV.external_ids(1396)
      end
    end

    subject { external_ids }

    it { expect(subject).to be_an_instance_of(Tmdb::TV) }
  end

  context '#backdrops' do
    let(:backdrops) do
      VCR.use_cassette 'tv/backdrops' do
        Tmdb::TV.backdrops(1396)
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
      VCR.use_cassette 'tv/posters' do
        Tmdb::TV.posters(1396)
      end
    end

    subject { posters }

    it 'should return an array of Tmdb::Poster' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Poster)
    end
  end

  context '#keywords' do
    let(:keywords) do
      VCR.use_cassette 'tv/keywords' do
        Tmdb::TV.keywords(1396)
      end
    end

    subject { keywords }

    it 'should return an array of Tmdb::Keyword' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Keyword)
    end
  end

  context '#similar' do
    let(:similar) do
      VCR.use_cassette 'tv/similar' do
        Tmdb::TV.similar(1396)
      end
    end

    subject { similar }

    it { expect(subject).to be_an_instance_of(Tmdb::TV) }

    it 'should have results of kind Tmdb::TV' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

  context '#translations' do
    let(:translations) do
      VCR.use_cassette 'tv/translations' do
        Tmdb::TV.translations(1396)
      end
    end

    subject { translations }

    it 'should return an array of Tmdb::Translation' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Translation)
    end
  end

  context '#videos' do
    let(:videos) do
      VCR.use_cassette 'tv/videos' do
        Tmdb::TV.videos(1396)
      end
    end

    subject { videos }

    it 'should return an array of Tmdb::Video' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Video)
    end
  end

  context '#latest' do
    let(:latest) do
      VCR.use_cassette 'tv/latest' do
        Tmdb::TV.latest
      end
    end

    subject { latest }

    it { expect(subject).to be_an_instance_of(Tmdb::TV) }

    it 'Tmdb::TV should contain created_by field' do
      expect(subject.created_by).to be_an_instance_of(Array)
    end

    it 'Tmdb::TV should contain networks field' do
      expect(subject.networks).to be_an_instance_of(Array)
    end

    it 'Tmdb::TV should contain seasons field' do
      expect(subject.seasons).to be_an_instance_of(Array)
    end

    it 'Tmdb::TV should contain genres field' do
      expect(subject.genres).to be_an_instance_of(Array)
    end

    it 'Tmdb::TV should contain production_companies field' do
      expect(subject.production_companies).to be_an_instance_of(Array)
    end
  end

  context '#on_the_air' do
    let(:on_the_air) do
      VCR.use_cassette 'tv/on_the_air' do
        Tmdb::TV.on_the_air
      end
    end

    subject { on_the_air }

    it { expect(subject).to be_an_instance_of(Tmdb::TV) }

    it 'should have results of kind Tmdb::TV' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

  context '#airing_today' do
    let(:airing_today) do
      VCR.use_cassette 'tv/airing_today' do
        Tmdb::TV.airing_today
      end
    end

    subject { airing_today }

    it { expect(subject).to be_an_instance_of(Tmdb::TV) }

    it 'should have results of kind Tmdb::TV' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

  context '#top_rated' do
    let(:top_rated) do
      VCR.use_cassette 'tv/top_rated' do
        Tmdb::TV.top_rated
      end
    end

    subject { top_rated }

    it { expect(subject).to be_an_instance_of(Tmdb::TV) }

    it 'should have results of kind Tmdb::TV' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

  context '#popular' do
    let(:popular) do
      VCR.use_cassette 'tv/popular' do
        Tmdb::TV.popular
      end
    end

    subject { popular }

    it { expect(subject).to be_an_instance_of(Tmdb::TV) }

    it 'should have results of kind Tmdb::TV' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

end
