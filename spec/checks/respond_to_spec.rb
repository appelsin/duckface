require 'spec_helper'

describe Duckface do

  context 'respond_to' do

    it 'works' do
      is_duck = Duckface.new do
        respond_to :quack
      end

      expect(is_duck.describes? Duck.new).to eq(true)
      expect(is_duck.describes? Dove.new).to eq(false)
      expect(is_duck.describes? Mandarin.new).to eq(true)
    end

    it 'works in group' do
      is_duck = Duckface.new do
        respond_to :quack
        respond_to :orange?
      end

      expect(is_duck.describes? Duck.new).to eq(false)
      expect(is_duck.describes? Dove.new).to eq(false)
      expect(is_duck.describes? Mandarin.new).to eq(true)
    end

    it 'works with defult objects' do
      is_struct = Duckface.new do
        respond_to :[]
      end

      expect(is_struct.describes?({})     ).to eq(true)
      expect(is_struct.describes? []      ).to eq(true)
      expect(is_struct.describes? 'string').to eq(true)
      expect(is_struct.describes? nil     ).to eq(false)
      expect(is_struct.describes? 17.3    ).to eq(false)
      expect(is_struct.describes? 173     ).to eq(true)
    end

  end

end
