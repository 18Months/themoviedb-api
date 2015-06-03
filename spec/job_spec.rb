require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Job do
  before(:each) do
    Tmdb::Api.key("8a221fc31fcdf12a8af827465574ffc9")
    Tmdb::Api.language('en')
  end

  it 'should respond to #list method' do
    Tmdb::Job.should respond_to(:list)
  end

  context '#list' do
    let(:jobs_list) do
      VCR.use_cassette 'job/list' do
        Tmdb::Job.list
      end
    end

    subject { jobs_list }

    it 'should be an Array' do
      jobs_list.should be_an_instance_of(Array)
    end

    it 'should contain many Tmdb::Job' do
      jobs_list.sample.should be_an_instance_of(Tmdb::Job)
    end
  end
end