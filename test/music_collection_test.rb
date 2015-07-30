require 'minitest/autorun'
require_relative '../lib/music_collection'

class FakeTrack
  def to_s
    return 'Amin'
  end
  def bpm
    return '120'
  end
end

describe MusicCollection do

  let(:mc) { MusicCollection.new }

  it "should start empty" do
    assert_equal 0, mc.length
    assert_equal 0, mc.count_for['Amin']
  end

  describe "#add_track" do
    it "should add a track" do
      mc.add_track(FakeTrack.new)
      assert_equal 1, mc.length
      assert_equal 1, mc.count_for['Amin']
    end
  end
end
