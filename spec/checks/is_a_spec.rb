require 'spec_helper'

describe Duckface do

  context 'is_a' do

    it 'works' do
      is_duck = Duckface.new do
        is_a Bird
      end

      expect(is_duck.describes? Duck.new).to eq(true)
      expect(is_duck.describes? Bird.new).to eq(true)
      expect(is_duck.describes? Dog.new ).to eq(false)
    end

    it 'works in group' do
      is_duck = Duckface.new do
        is_a Flying
        is_a Animal
      end

      expect(is_duck.describes? Duck.new).to eq(true)
      expect(is_duck.describes? Bird.new).to eq(true)
      expect(is_duck.describes? Dog.new ).to eq(false)
    end

    it 'works with defult objects' do
      is_struct = Duckface.new do
        is_a Comparable
      end

      expect(is_struct.describes?({})     ).to eq(false)
      expect(is_struct.describes? []      ).to eq(false)
      expect(is_struct.describes? 'string').to eq(true)
      expect(is_struct.describes? nil     ).to eq(false)
      expect(is_struct.describes? 17.3    ).to eq(true)
      expect(is_struct.describes? 173     ).to eq(true)
    end

  end

end
