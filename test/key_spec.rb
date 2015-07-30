require 'minitest/autorun'
require_relative '../lib/key'

class TestKey < Minitest::Test
 
  def setup
    @key = Key.new
  end

  def test_foo
    assert_equal "foo", @key.name
  end
end
