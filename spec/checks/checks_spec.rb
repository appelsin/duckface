require 'spec_helper'

TYPING_METHODS = [
    'respond_to',
    'not_respond_to',
    'is_a',
    'not_a'
]

describe Duckface do

  context 'Duckface.new' do
    it "has all methods" do
      expect do
        Duckface.new do
          TYPING_METHODS.each do |method|
            self.send method, 'value'
          end
        end
      end.not_to raise_error
    end
  end

  context 'Duckface::Interface' do
    it "has all methods" do
      expect do
        class HasAllMethodsThing < Duckface::Interface
          TYPING_METHODS.each do |method|
            self.send method, 'value'
          end
        end
      end.not_to raise_error
    end
  end

end
