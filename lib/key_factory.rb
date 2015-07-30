require_relative 'key'
require_relative 'null_key'

class KeyFactory
  
  def self.key(key_str)
    @key_str = key_str
    expand_abbreviation
    valid? ? Key.new(@key_str) : NullKey.new
  end

  class << self
    private

    def expand_abbreviation
      if abbreviation?
        Key::MINOR_KEYS.each { |full| @key_str = full if full.start_with? @key_str }
      end
    end

    def abbreviation?
      !@key_str.empty? && @key_str.length < 4
    end

    def valid?
      !@key_str.empty? && (Key::MINOR_KEYS + Key::MAJOR_KEYS).include?(@key_str)
    end
  end
end
