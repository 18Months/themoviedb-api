require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Keyword do
  before(:each) do
    Tmdb::Api.key("8a221fc31fcdf12a8af827465574ffc9")
    Tmdb::Api.language('en')
  end

  context '#detail' do
    let(:keyword_detail) do
      VCR.use_cassette 'keyword/detail' do
        Tmdb::Keyword.detail(1721)
      end
    end

    subject { keyword_detail }

    it 'should generate an Tmdb::Keyword object' do
      keyword_detail.should be_an_instance_of(Tmdb::Keyword)
    end
  end

  context '#movies' do
    let(:keyword_movies) do
      VCR.use_cassette 'keyword/movies' do
        Tmdb::Keyword.movies(1721)
      end
    end

    let(:keyword_movies_paginated) do
      VCR.use_cassette 'keyword/movies_page_2' do
        Tmdb::Keyword.movies(1721, page: 2)
      end
    end

    subject { keyword_movies }

    it { should be_an_instance_of(Tmdb::Keyword) }
    it 'should have results of kind Tmdb::Movie' do
      keyword_movies.results.first.should be_an_instance_of(Tmdb::Movie)
    end

    it 'could have multiple pages' do
      keyword_movies_paginated.page.should == 2
    end
  end
end