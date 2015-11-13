require 'spec_helper'

describe Duckface do
  
  it 'has a version number' do
    expect(Duckface::VERSION).not_to be nil
  end

  it 'always return true if empty' do
    expect(Duckface.new.describes? 'string').to be true

    class Anything < Duckface::Interface; end
    expect(Anything.describes? 'string').to be true
  end

end
