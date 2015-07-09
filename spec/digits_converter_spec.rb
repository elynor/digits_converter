require 'rspec'
require_relative '../digits_converter'

describe DigitsConverter do
  before(:all) do
    @converter = DigitsConverter.new
  end

  describe '#convert' do
    it 'converts single number' do
      expect(@converter.convert(1)).to eq('one')
    end

    it 'converts 11 - 19 numbers' do
      expect(@converter.convert(15)).to eq('fifteen')
    end

    it 'converts tens' do
      expect(@converter.convert(35)).to eq('thirty five')
    end

    it 'converts delimiters of 10' do
      expect(@converter.convert(30)).to eq('thirty')
    end

    it 'converts hundreds' do
      expect(@converter.convert(155)).to eq('one hundred fifty five')
    end

    it 'converts delimiters of 100' do
      expect(@converter.convert(300)).to eq('three hundred')
    end

    it 'converts 0' do
      expect(@converter.convert(0)).to eq('zero')
    end

    it 'converts thousands' do
      expect(@converter.convert(1221)).to eq('one thousand two hundred twenty one')
    end

    it 'converts delimiters of 1000' do
      expect(@converter.convert(1000)).to eq('one thousand')
    end

    it 'converts millions' do
      expect(@converter.convert(1_100_000)).to eq('one million one hundred thousand')
    end
  end
end
