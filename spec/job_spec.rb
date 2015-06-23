require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Job do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Job }

  it { is_expected.to respond_to(:list) }

  context '#list' do
    let(:list) do
      VCR.use_cassette 'job/list' do
        Tmdb::Job.list
      end
    end

    subject { list }

    it 'should be an Array' do
      expect(subject).to be_an_instance_of(Array)
    end

    it 'should contain many Tmdb::Job' do
      expect(subject.sample).to be_an_instance_of(Tmdb::Job)
    end
  end

end