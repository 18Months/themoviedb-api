require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Certification do

  before(:all) do
    Tmdb::Api.key(TmdbDefaultApiKey)
    Tmdb::Api.language(TmdbDefaultLanguage)
  end

  after(:all) do
    Tmdb::Api.key(nil)
    Tmdb::Api.language(nil)
  end

  subject { Tmdb::Certification }

  it { is_expected.to respond_to(:movie_list) }
  it { is_expected.to respond_to(:tv_list) }

  context '#movie_list' do
    let(:certification_movie_list) do
      VCR.use_cassette 'certification/movie_list' do
        Tmdb::Certification.movie_list
      end
    end

    subject { certification_movie_list }

    it 'should be an Hash' do
      expect(subject).to be_an_instance_of(Hash)
    end

    it 'should contain an Array of Tmdb::Certification' do
      rand_key = subject.keys.sample
      expect(subject[rand_key]).to be_an_instance_of(Array)
      expect(subject[rand_key].sample).to be_an_instance_of(Tmdb::Certification)
    end
  end

  context '#tv_list' do
    let(:certification_tv_list) do
      VCR.use_cassette 'certification/tv_list' do
        Tmdb::Certification.tv_list
      end
    end

    subject { certification_tv_list }

    it 'should be an Hash' do
      expect(subject).to be_an_instance_of(Hash)
    end

    it 'should contain an Array of Tmdb::Certification' do
      rand_key = subject.keys.sample
      expect(subject[rand_key]).to be_an_instance_of(Array)
      expect(subject[rand_key].sample).to be_an_instance_of(Tmdb::Certification)
    end
  end

end
