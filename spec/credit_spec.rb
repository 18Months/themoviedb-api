require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Credit do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Credit }

  it { is_expected.to respond_to(:detail) }

  context '#detail' do
    let(:detail) do
      VCR.use_cassette 'credit/detail' do
        Tmdb::Credit.detail('5256c8b219c2956ff6047cd8')
      end
    end

    subject { detail }

    it { expect(subject).to be_an_instance_of(Tmdb::Credit) }

    it 'should have media of kind Tmdb::Media' do
      expect(subject.media).to be_an_instance_of(Tmdb::Media)
    end

    it 'should have a person associated of kind Tmdb::Person' do
      expect(subject.person).to be_an_instance_of(Tmdb::Person)
    end
  end

end
