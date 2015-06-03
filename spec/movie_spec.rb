require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Movie do

  before(:each) do
    Tmdb::Api.key("8a221fc31fcdf12a8af827465574ffc9")
    Tmdb::Api.language('en')
  end

  context '#detail' do

    let(:movie) do
      VCR.use_cassette 'movie/detail' do
        Tmdb::Movie.detail(550)
      end
    end

    subject { movie }

    it 'should return an Tmdb::Movie object' do
      movie.should be_an_instance_of(Tmdb::Movie)
    end

  end

  context '#alternative_titles' do

    let(:movie) do
      VCR.use_cassette 'movie/alternative_titles' do
        Tmdb::Movie.alternative_titles(550)
      end
    end

    subject { movie }

    it 'should return an array of Tmdb::Movie object' do
      movie.should be_an_instance_of(Array)
      movie.sample.should be_an_instance_of(Tmdb::Movie)
    end

  end

  context '#credits' do

    let(:movie) do
      VCR.use_cassette 'movie/credits' do
        Tmdb::Movie.credits(550)
      end
    end

    subject { movie }

    it 'should return an array of Tmdb::Movie object' do
      movie.should be_an_instance_of(Array)
      movie.sample.should be_an_instance_of(Tmdb::Movie)
    end

  end

  it { should respond_to(:credits) }
  it { should respond_to(:images) }
  it { should respond_to(:keywords) }
  it { should respond_to(:release) }
  it { should respond_to(:trailers) }
  it { should respond_to(:translations) }
  it { should respond_to(:similar_movies) }
  it { should respond_to(:reviews) }
  it { should respond_to(:lists) }
  it { should respond_to(:changes) }

  it { should respond_to(:latest) }
  it { should respond_to(:upcoming) }
  it { should respond_to(:now_playing) }
  it { should respond_to(:popular) }
  it { should respond_to(:top_rated) }

end