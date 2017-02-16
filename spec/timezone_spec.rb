# frozen_string_literal: true
require 'rspec'
require 'spec_helper'
require 'vcr'

describe Tmdb::Timezone do
    before(:all) do
        Tmdb::Api.key(TmdbDefaultApiKey)
        Tmdb::Api.language(TmdbDefaultLanguage)
    end

    after(:all) do
        Tmdb::Api.key(nil)
        Tmdb::Api.language(nil)
    end

    subject { Tmdb::Timezone }

    it { is_expected.to respond_to(:get) }

    context '#get' do
        let(:timezone_get) do
            VCR.use_cassette 'timezone/get' do
                Tmdb::Timezone.get
            end
        end

        subject { timezone_get }
    end
end
