require 'rspec'
require 'spec_helper'

describe Tmdb::Api do

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  let!(:api) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)

    Tmdb::Api
  end

  it { expect(Tmdb::Api).to respond_to(:params) }
  it { expect(Tmdb::Api).to respond_to(:key) }
  it { expect(Tmdb::Api).to respond_to(:language) }

  subject { api }

  it 'param should be an Hash' do
    expect(subject.params).to be_an_instance_of(Hash)
  end

  it 'should set the API Key' do
    expect {
      subject.key(TmdbDefaultApiKey)
    }.to change {
      subject.params[:api_key]
    }.from(nil).to(TmdbDefaultApiKey)
  end

  it 'should set the correct language' do
    expect {
      subject.language(TmdbDefaultLanguage)
    }.to change {
      subject.params[:language]
    }.from(nil).to(TmdbDefaultLanguage)
  end

end
