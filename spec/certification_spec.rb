require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Certification do
  before(:each) do
    Tmdb::Api.key("8a221fc31fcdf12a8af827465574ffc9")
    Tmdb::Api.language('en')
  end

  it 'should respond to #list method' do
    Tmdb::Certification.should respond_to(:list)
  end

  context '#list' do
    let(:certification_list) do
      VCR.use_cassette 'certification/list' do
        Tmdb::Certification.list
      end
    end

    subject { certification_list }

    it 'should be an Hash' do
      certification_list.should be_an_instance_of(Hash)
    end

    it 'should contain an Array of Tmdb::Certification' do
      rand_key = certification_list.keys.sample
      certification_list[rand_key].should be_an_instance_of(Array)
      certification_list[rand_key].sample.should be_an_instance_of(Tmdb::Certification)
    end

  end

end