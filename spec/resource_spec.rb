require 'rspec'
require 'spec_helper'

describe Tmdb::Resource do
  let(:resource) { Tmdb::Resource.new(Tmdb::Struct) }
  subject { resource }
end