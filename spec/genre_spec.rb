require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Genre do
  before(:each) do
    Tmdb::Api.key("8a221fc31fcdf12a8af827465574ffc9")
    Tmdb::Api.language('en')
  end

  it 'should respond to #list method' do
    Tmdb::Genre.should respond_to(:list)
  end

  context '#list' do
    let(:genre_list) do
      VCR.use_cassette 'genre/list' do
        Tmdb::Genre.list
      end
    end

    subject { genre_list }

    it 'should be an Array' do
      genre_list.should be_an_instance_of(Array)
    end

    it 'should contain many Tmdb::Genre' do
      genre_list.sample.should be_an_instance_of(Tmdb::Genre)
    end
  end

  context '#movies' do
    let(:genre_movies) do
      VCR.use_cassette 'genre/movies' do
        Tmdb::Genre.movies(18)
      end
    end

    let(:genre_movies_paginated) do
      VCR.use_cassette 'genre/movies_page_2' do
        Tmdb::Genre.movies(18, page: 2)
      end
    end

    subject { genre_movies }

    it { should be_an_instance_of(Tmdb::Genre) }
    it 'should have results of kind Tmdb::Movie' do
      genre_movies.results.sample.should be_an_instance_of(Tmdb::Movie)
    end

    it 'could have multiple pages' do
      genre_movies_paginated.page.should == 2
    end
  end
end