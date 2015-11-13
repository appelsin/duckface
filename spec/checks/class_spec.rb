require 'spec_helper'

describe Duckface::Interface do

  context 'class synthax' do

    it 'works' do
      class IsDuck < Duckface::Interface
        respond_to :quack
      end

      expect(IsDuck.describes? Duck.new).to eq(true)
      expect(IsDuck.describes? Dove.new).to eq(false)
      expect(IsDuck.describes? Mandarin.new).to eq(true)
    end

    it 'doesn\'t mess' do
      class IsDove < Duckface::Interface
        respond_to :coo
      end

      class IsDog < Duckface::Interface
        respond_to :bark
      end

      expect(IsDove.describes? Dove.new).to eq(true)
      expect(IsDove.describes? Dog.new ).to eq(false)
      expect(IsDog.describes?  Dove.new).to eq(false)
      expect(IsDog.describes?  Dog.new ).to eq(true)
    end

  end

end
