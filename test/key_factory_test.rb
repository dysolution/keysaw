require 'minitest/autorun'
require_relative '../lib/key_factory'

describe KeyFactory do

  let(:a_min) { KeyFactory.key('Amin') }
  let(:a_m) { KeyFactory.key('Am') }

  it "should accept valid key names" do
    assert_instance_of Key, a_min
  end

  it "should accept abbreviations" do
    assert_equal a_min, a_m
  end

  it "should reject a blank key string" do
    assert_instance_of NullKey, KeyFactory.key('')
  end

  it "should reject invalid names" do 
    assert_instance_of NullKey, KeyFactory.key('invalid')
    assert_instance_of NullKey, KeyFactory.key('Gflat')
  end
end
