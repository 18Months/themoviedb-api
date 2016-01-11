require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Search do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Search }

  it { is_expected.to respond_to(:company) }
  it { is_expected.to respond_to(:collection) }
  it { is_expected.to respond_to(:keyword) }
  it { is_expected.to respond_to(:list) }
  it { is_expected.to respond_to(:movie) }
  it { is_expected.to respond_to(:multi) }
  it { is_expected.to respond_to(:person) }
  it { is_expected.to respond_to(:tv) }

  context '#company' do
    let(:company) do
      VCR.use_cassette 'search/company' do
        Tmdb::Search.company('Disney')
      end
    end

    subject { company }

    it { expect(subject).to be_an_instance_of(Tmdb::Result) }

    it 'should have results of kind Tmdb::Company' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Company)
    end
  end

  context '#collection' do
    let(:collection) do
      VCR.use_cassette 'search/collection' do
        Tmdb::Search.collection('Disney')
      end
    end

    subject { collection }

    it { expect(subject).to be_an_instance_of(Tmdb::Result) }

    it 'should have results of kind Tmdb::Collection' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Collection)
    end
  end

  context '#keyword' do
    let(:keyword) do
      VCR.use_cassette 'search/keyword' do
        Tmdb::Search.keyword('Disney')
      end
    end

    subject { keyword }

    it { expect(subject).to be_an_instance_of(Tmdb::Result) }

    it 'should have results of kind Tmdb::Keyword' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Keyword)
    end
  end

  context '#list' do
    let(:list) do
      VCR.use_cassette 'search/list' do
        Tmdb::Search.list('Disney')
      end
    end

    subject { list }

    it { expect(subject).to be_an_instance_of(Tmdb::Result) }

    it 'should have results of kind Tmdb::List' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::List)
    end
  end

  context '#movie' do
    let(:movie) do
      VCR.use_cassette 'search/movie' do
        Tmdb::Search.movie('Disney')
      end
    end

    subject { movie }

    it { expect(subject).to be_an_instance_of(Tmdb::Result) }

    it 'should have results of kind Tmdb::Movie' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#multi' do
    let(:multi) do
      VCR.use_cassette 'search/multi' do
        Tmdb::Search.multi('Disney')
      end
    end

    subject { multi }

    it { expect(subject).to be_an_instance_of(Tmdb::Result) }

    it 'should have results of kind Tmdb::Multi' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Multi)
    end
  end

  context '#person' do
    let(:person) do
      VCR.use_cassette 'search/person' do
        Tmdb::Search.person('Angelina Jolie')
      end
    end

    subject { person }

    it { expect(subject).to be_an_instance_of(Tmdb::Result) }

    it 'should have results of kind Tmdb::Person' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Person)
    end

    it 'Tmdb::Person should contain known_for field with misc objects' do
      expect(subject.results.first.known_for).to be_an_instance_of(Array)
      expect(subject.results.first.known_for.first).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#tv' do
    let(:tv) do
      VCR.use_cassette 'search/tv' do
        Tmdb::Search.tv('Disney')
      end
    end

    subject { tv }

    it { expect(subject).to be_an_instance_of(Tmdb::Result) }

    it 'should have results of kind Tmdb::TV' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::TV)
    end
  end

end
