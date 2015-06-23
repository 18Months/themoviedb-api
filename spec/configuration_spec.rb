require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Configuration do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Configuration }

  it { is_expected.to respond_to(:get) }

  context '#get' do
    let(:configuration_get) do
      VCR.use_cassette 'configuration/get' do
        Tmdb::Configuration.get
      end
    end

    subject { configuration_get }

    it 'should be a Tmdb::Configuration' do
      expect(subject).to be_an_instance_of(Tmdb::Configuration)
    end

    it 'should contain "images" configuration' do
      expect(subject.images).to be_an_instance_of(Tmdb::Configuration)
    end

    it 'should contain "change_keys" configuration' do
      expect(subject.images).to be_an_instance_of(Tmdb::Configuration)
    end
  end

end
