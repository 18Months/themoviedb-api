require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Person do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Person }

  it { is_expected.to respond_to(:detail) }
  it { is_expected.to respond_to(:movie_credits) }
  it { is_expected.to respond_to(:tv_credits) }
  it { is_expected.to respond_to(:combined_credits) }
  it { is_expected.to respond_to(:external_ids) }
  it { is_expected.to respond_to(:images) }
  it { is_expected.to respond_to(:tagged_images) }
  it { is_expected.to respond_to(:changes) }
  it { is_expected.to respond_to(:popular) }
  it { is_expected.to respond_to(:latest) }

  context '#detail' do
    let(:detail) do
      VCR.use_cassette 'person/detail' do
        Tmdb::Person.detail(1)
      end
    end

    subject { detail }

    it { expect(subject).to be_an_instance_of(Tmdb::Person) }
  end

  context '#movie_credits' do
    let(:movie_credits) do
      VCR.use_cassette 'person/movie_credits' do
        Tmdb::Person.movie_credits(1)
      end
    end

    subject { movie_credits }

    it { expect(subject).to be_an_instance_of(Tmdb::Person) }

    it 'should have cast of kind Tmdb::Person' do
      expect(subject.cast.sample).to be_an_instance_of(Tmdb::Person)
    end

    it 'should have crew of kind Tmdb::Person' do
      expect(subject.crew.sample).to be_an_instance_of(Tmdb::Person)
    end
  end

  context '#tv_credits' do
    let(:tv_credits) do
      VCR.use_cassette 'person/tv_credits' do
        Tmdb::Person.tv_credits(1)
      end
    end

    subject { tv_credits }

    it { expect(subject).to be_an_instance_of(Tmdb::Person) }

    it 'should have cast of kind Tmdb::Person' do
      expect(subject.cast.sample).to be_an_instance_of(Tmdb::Person)
    end

    it 'should have crew of kind Tmdb::Person' do
      expect(subject.crew.sample).to be_an_instance_of(Tmdb::Person)
    end
  end

  context '#combined_credits' do
    let(:combined_credits) do
      VCR.use_cassette 'person/combined_credits' do
        Tmdb::Person.combined_credits(1)
      end
    end

    subject { combined_credits }

    it { expect(subject).to be_an_instance_of(Tmdb::Person) }

    it 'should have cast of kind Tmdb::Person' do
      expect(subject.cast.sample).to be_an_instance_of(Tmdb::Person)
    end

    it 'should have crew of kind Tmdb::Person' do
      expect(subject.crew.sample).to be_an_instance_of(Tmdb::Person)
    end
  end

  context '#external_ids' do
    let(:external_ids) do
      VCR.use_cassette 'person/external_ids' do
        Tmdb::Person.external_ids(1)
      end
    end

    subject { external_ids }

    it { expect(subject).to be_an_instance_of(Tmdb::Person) }
  end

  context '#images' do
    let(:images) do
      VCR.use_cassette 'person/images' do
        Tmdb::Person.images(1)
      end
    end

    subject { images }

    it { expect(subject).to be_an_instance_of(Tmdb::Image) }

    it 'should have profiles of kind Tmdb::Image' do
      expect(subject.profiles.sample).to be_an_instance_of(Tmdb::Image)
    end
  end

  context '#tagged_images' do
    let(:tagged_images) do
      VCR.use_cassette 'person/tagged_images' do
        Tmdb::Person.tagged_images(287)
      end
    end

    subject { tagged_images }

    it { expect(subject).to be_an_instance_of(Tmdb::Image) }

    it 'should have results of kind Tmdb::Image' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Image)
    end

    it 'Tmdb::Image result should contain media field with misc objects' do
      expect(subject.results.first.media).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#changes' do
    let(:changes) do
      VCR.use_cassette 'person/changes' do
        Tmdb::Person.changes(1, start_date: '2014-02-19', end_date: '2014-03-01')
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

  context '#popular' do
    let(:popular) do
      VCR.use_cassette 'person/popular' do
        Tmdb::Person.popular
      end
    end

    subject { popular }

    it { expect(subject).to be_an_instance_of(Tmdb::Person) }

    it 'should have results of kind Tmdb::Person' do
      expect(subject.results.sample).to be_an_instance_of(Tmdb::Person)
    end

    it 'Tmdb::Person should contain known_for field with misc objects' do
      expect(subject.results.first.known_for).to be_an_instance_of(Array)
      expect(subject.results.first.known_for.first).to be_an_instance_of(Tmdb::Movie)
    end
  end

  context '#latest' do
    let(:latest) do
      VCR.use_cassette 'person/latest' do
        Tmdb::Person.latest
      end
    end

    subject { latest }

    it { expect(subject).to be_an_instance_of(Tmdb::Person) }
  end

end
