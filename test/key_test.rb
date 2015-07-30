require 'minitest/autorun'
require_relative '../lib/key'

class TestKey < Minitest::Test
 
  def setup
    @minor_key = Key.new("Gmin")
    @major_key = Key.new("Dmaj")
  end

  def test_to_s
    assert_equal "Dmaj", @major_key.to_s
    assert_equal "Gmin", @minor_key.to_s
  end

  def test_quality
    assert_equal @major_key.quality, "major"
    assert_equal @minor_key.quality, "minor"
  end

  def test_up_fifth
    assert_equal Key.new('Amin').up_fifth, 'Emin'
    assert_equal Key.new('Dmin').up_fifth, 'Amin'
    assert_equal Key.new('C#min').up_fifth, 'G#min'
    assert_equal Key.new('G#min').up_fifth, 'D#min'
  end

  def test_down_fifth
    assert_equal Key.new('Dmin').down_fifth, 'Gmin'
    assert_equal Key.new('G#min').down_fifth, 'C#min'
    assert_equal Key.new('A#min').down_fifth, 'D#min'
  end

  def test_relative
    assert_equal Key.new('Dmin').relative, 'Fmaj'
    assert_equal Key.new('Cmaj').relative, 'Amin'
  end

  def test_can_be_followed_with
    k1 =  Key.new('Amin')
    assert k1.can_be_followed_with Key.new('Emin')
    assert k1.can_be_followed_with Key.new('Dmin')
    assert k1.can_be_followed_with Key.new('Cmaj')
    assert k1.can_be_followed_with Key.new('Amin')

    refute k1.can_be_followed_with Key.new('Fmin')
    refute k1.can_be_followed_with Key.new('D#min')
    refute k1.can_be_followed_with Key.new('Cmin')
  end
end
