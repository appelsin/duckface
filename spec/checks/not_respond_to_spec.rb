require 'spec_helper'

describe Duckface do

  context 'not_respond_to' do

    it 'works' do
      not_duck = Duckface.new do
        not_respond_to :quack
      end

      expect(not_duck.describes? Duck.new).to eq(false)
      expect(not_duck.describes? Dove.new).to eq(true)
      expect(not_duck.describes? Mandarin.new).to eq(false)
    end

    it 'works in group' do
      not_duck = Duckface.new do
        not_respond_to :quack
        not_respond_to :orange?
      end

      expect(not_duck.describes? Duck.new).to eq(false)
      expect(not_duck.describes? Dove.new).to eq(true)
      expect(not_duck.describes? Mandarin.new).to eq(false)
    end

    it 'works with defult objects' do
      not_struct = Duckface.new do
        not_respond_to :[]
      end

      expect(not_struct.describes?({})     ).to eq(false)
      expect(not_struct.describes? []      ).to eq(false)
      expect(not_struct.describes? 'string').to eq(false)
      expect(not_struct.describes? nil     ).to eq(true)
      expect(not_struct.describes? 17.3    ).to eq(true)
      expect(not_struct.describes? 173     ).to eq(false)
    end

  end

end
