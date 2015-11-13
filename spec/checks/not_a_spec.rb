require 'spec_helper'

describe Duckface do

  context 'not_a' do

    it 'works' do
      not_duck = Duckface.new do
        not_a Bird
      end

      expect(not_duck.describes? Duck.new).to eq(false)
      expect(not_duck.describes? Bird.new).to eq(false)
      expect(not_duck.describes? Dog.new ).to eq(true)
    end

    it 'works in group' do
      sure_not_duck = Duckface.new do
        not_a Flying
        not_a Animal
      end

      expect(sure_not_duck.describes? Duck.new).to eq(false)
      expect(sure_not_duck.describes? Bird.new).to eq(false)
      expect(sure_not_duck.describes? Dog.new ).to eq(false)

      not_duck = Duckface.new do
        not_a Flying
        is_a Animal
      end

      expect(not_duck.describes? Duck.new).to eq(false)
      expect(not_duck.describes? Bird.new).to eq(false)
      expect(not_duck.describes? Dog.new ).to eq(true)
    end

    it 'works with defult objects' do
      is_struct = Duckface.new do
        not_a Comparable
        not_a Enumerable
      end

      expect(is_struct.describes?({})     ).to eq(false)
      expect(is_struct.describes? []      ).to eq(false)
      expect(is_struct.describes? 'string').to eq(false)
      expect(is_struct.describes? nil     ).to eq(true)
      expect(is_struct.describes? 17.3    ).to eq(false)
      expect(is_struct.describes? 173     ).to eq(false)
    end

  end

end
