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

    it { expect(subject).to be_an_instance_of(Tmdb::Movie) }

    it 'Tmdb::Movie should contain genres field with Tmdb::Genre objects' do
      expect(subject.genres).to be_an_instance_of(Array)
      expect(subject.genres.first).to be_an_instance_of(Tmdb::Genre)
    end

    it 'Tmdb::Movie should contain production_companies field with Tmdb::Company objects' do
      expect(subject.production_companies).to be_an_instance_of(Array)
      expect(subject.production_companies.first).to be_an_instance_of(Tmdb::Company)
    end

    it 'Tmdb::Movie should contain production_countries field with Tmdb::Country objects' do
      expect(subject.production_countries).to be_an_instance_of(Array)
      expect(subject.production_countries.first).to be_an_instance_of(Tmdb::Country)
    end

    it 'Tmdb::Movie should contain spoken_languages field with Tmdb::Language objects' do
      expect(subject.spoken_languages).to be_an_instance_of(Array)
      expect(subject.spoken_languages.first).to be_an_instance_of(Tmdb::Language)
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

  context '#backdrops' do
    let(:backdrops) do
      VCR.use_cassette 'movie/backdrops' do
        Tmdb::Movie.backdrops(550)
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
      VCR.use_cassette 'movie/posters' do
        Tmdb::Movie.posters(550)
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
      VCR.use_cassette 'movie/videos' do
        Tmdb::Movie.videos(550)
      end
    end

    subject { videos }

    it 'should return an array of Tmdb::Video' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Video)
    end
  end

  context '#keywords' do
    let(:keywords) do
      VCR.use_cassette 'movie/keywords' do
        Tmdb::Movie.keywords(550)
      end
    end

    subject { keywords }

    it 'should return an array of Tmdb::Keyword' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Keyword)
    end
  end

  context '#releases' do
    let(:releases) do
      VCR.use_cassette 'movie/releases' do
        Tmdb::Movie.releases(550)
      end
    end

    subject { releases }

    it 'should return an array of Tmdb::Release' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Release)
    end
  end

  context '#translations' do
    let(:translations) do
      VCR.use_cassette 'movie/translations' do
        Tmdb::Movie.translations(550)
      end
    end

    subject { translations }

    it 'should return an array of Tmdb::Translation' do
      expect(subject).to be_an_instance_of(Array)
      expect(subject.sample).to be_an_instance_of(Tmdb::Translation)
    end
  end

  context '#similar' do
    let(:similar) do
      VCR.use_cassette 'movie/similar' do
        Tmdb::Movie.similar(550)
      end
    end

    subject { similar }

    it { expect(subject).to be_an_instance_of(Tmdb::Movie) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#recommendations' do
    let(:recommendations) do
      VCR.use_cassette 'movie/recommendations' do
        Tmdb::Movie.recommendations(550)
      end
    end

    subject { recommendations }

    it { expect(subject).to be_an_instance_of(Tmdb::Recommendation) }
  end

  context '#reviews' do
    let(:reviews) do
      VCR.use_cassette 'movie/reviews' do
        Tmdb::Movie.reviews(550)
      end
    end

    subject { reviews }

    it { expect(subject).to be_an_instance_of(Tmdb::Review) }
  end

  context '#lists' do
    let(:lists) do
      VCR.use_cassette 'movie/lists' do
        Tmdb::Movie.lists(550)
      end
    end

    subject { lists }

    it { expect(subject).to be_an_instance_of(Tmdb::List) }

    it 'should have results of kind Tmdb::List' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::List)
    end
  end

  context '#changes' do
    let(:changes) do
      VCR.use_cassette 'movie/changes' do
        Tmdb::Movie.changes(550, start_date: '2015-06-20', end_date: '2015-06-26')
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

  context '#latest' do
    let(:latest) do
      VCR.use_cassette 'movie/latest' do
        Tmdb::Movie.latest
      end
    end

    subject { latest }

    it 'should return an Tmdb::Movie object' do
      expect(subject).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#upcoming' do
    let(:upcoming) do
      VCR.use_cassette 'movie/upcoming' do
        Tmdb::Movie.upcoming
      end
    end

    subject { upcoming }

    it { expect(subject).to be_an_instance_of(Tmdb::Movie) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#now_playing' do
    let(:now_playing) do
      VCR.use_cassette 'movie/now_playing' do
        Tmdb::Movie.now_playing
      end
    end

    subject { now_playing }

    it { expect(subject).to be_an_instance_of(Tmdb::Movie) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#popular' do
    let(:popular) do
      VCR.use_cassette 'movie/popular' do
        Tmdb::Movie.popular
      end
    end

    subject { popular }

    it { expect(subject).to be_an_instance_of(Tmdb::Movie) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#top_rated' do
    let(:top_rated) do
      VCR.use_cassette 'movie/top_rated' do
        Tmdb::Movie.top_rated
      end
    end

    subject { top_rated }

    it { expect(subject).to be_an_instance_of(Tmdb::Movie) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

end
