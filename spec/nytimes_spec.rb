require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/nytimes'
require 'rspec'

RSpec.describe Nytimes do
  before(:each) do
    @hash = Nytimes::DATA
  end

  describe 'data pulls' do
    it 'can get the copyright information' do
      result = @hash[:copyright]
      expected = "Copyright (c) 2018 The New York Times Company. All Rights Reserved."

      expect(result).to eq(expected)
    end

    it 'can get an array of stories' do
      result = @hash[:results]

      expect(result.class).to eq(Array)
      expect(result.count).to eq(44)
    end

    it 'can get all stories with a subsection of politics' do
      result = @hash[:results].find_all { |result| result[:subsection] == "Politics" }

      expected1 = "Congressional G.O.P. Agenda Quietly Falls Into Place Even as Trump Steals the Spotlight"
      expected2 = "Conspiracy Theories Made Alex Jones Very Rich. They May Bring Him Down."

      expect(result.class).to eq(Array)
      expect(result.count).to eq(6)
      expect(result.first[:title]).to eq(expected1)
      expect(result.last[:title]).to eq(expected2)
    end
  end
end
