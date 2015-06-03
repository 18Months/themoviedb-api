require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Configuration do
  before(:each) do
    Tmdb::Api.key("8a221fc31fcdf12a8af827465574ffc9")
    Tmdb::Api.language('en')
  end

  let!(:configuration) { Tmdb::Configuration.new }
  subject { configuration }

  its(:query_url) { should == '/configuration' }

  it 'should call get_configuration on #conf' do
    VCR.use_cassette 'configuration/get' do
      configuration.should_receive(:get_configuration)
      configuration.conf
    end
  end

  context '#conf' do
    let(:konf) do
      VCR.use_cassette 'configuration/get' do
        configuration.conf
      end
    end

    subject { konf }

    it 'should recover the remote configuration' do
      konf.should == {"images"=>{"base_url"=>"http://image.tmdb.org/t/p/", "secure_base_url"=>"https://image.tmdb.org/t/p/", "backdrop_sizes"=>["w300", "w780", "w1280", "original"], "logo_sizes"=>["w45", "w92", "w154", "w185", "w300", "w500", "original"], "poster_sizes"=>["w92", "w154", "w185", "w342", "w500", "original"], "profile_sizes"=>["w45", "w185", "h632", "original"], "still_sizes"=>["w92", "w185", "w300", "original"]}, "change_keys"=>["adult", "also_known_as", "alternative_titles", "biography", "birthday", "budget", "cast", "character_names", "crew", "deathday", "general", "genres", "homepage", "images", "imdb_id", "name", "original_title", "overview", "plot_keywords", "production_companies", "production_countries", "releases", "revenue", "runtime", "spoken_languages", "status", "tagline", "title", "trailers", "translations"]}
    end

    it 'should have an "images" key' do
      konf.should have_key("images")
    end

    it 'should have an "change_keys" key' do
      konf.should have_key("change_keys")
    end
  end

  context '#update_configuration' do
    it 'should call get_configuration' do
      VCR.use_cassette 'configuration/get' do
        configuration.should_receive(:get_configuration)
        configuration.update_configuration
      end
    end
  end
end