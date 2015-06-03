require 'rspec'
require 'spec_helper'

describe Tmdb::Api do
  let!(:api) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)

    Tmdb::Api
  end

  after(:all) {
    api.key(nil)
    api.language(nil)
  }

  subject { api }

  context '#config' do
    its(:params) { should be_an_instance_of(Hash) }
  end

  context '#key' do
    it 'should set the API Key' do
      expect {
        Tmdb::Api.key("8a221fc31fcdf12a8af827465574ffc9")
      }.to change {
        Tmdb::Api.params[:api_key]
      }.from(nil).to("8a221fc31fcdf12a8af827465574ffc9")
    end
  end

  context '#language' do
    it 'should set the correct language' do
      expect {
        Tmdb::Api.language('it')
      }.to change {
        Tmdb::Api.params[:language]
      }.from(nil).to('it')
    end
  end
end