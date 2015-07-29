class NullKey
  def up_fifth
    self
  end

  def down_fifth
    self
  end

  def relative
    self
  end
end


class Key

  MINOR_KEYS = %w(G#min D#min A#min Fmin Cmin Gmin Dmin Amin Emin Bmin F#min C#min)
  MAJOR_KEYS = %w(Bmaj F#maj C#maj G#maj D#maj A#maj Fmaj Cmaj Gmaj Dmaj Amaj Emaj)

  attr_accessor :key

  def initialize(key)
    @key = key
  end

  def major?
    @key.downcase.end_with?('maj')
  end

  def minor?
    @key.downcase.end_with?('min')
  end

  def quality
    if major? then return 'major' end
    if minor? then return 'minor' end
    raise "couldn't determine key quality: {@key}"
  end

  def can_be_followed_with(other)
     [@key, relative, up_fifth, down_fifth].include?(other.key)
   end

  def up_fifth
    key_num < 11 ? keys[key_num + 1] : keys[0]
  end

  def down_fifth
    key_num > 0 ? keys[key_num - 1] : keys[11]
  end

  def relative
    return relatives[key_num]
  end

  def valid
    keys.include?(@key)
  end

  private

  def keys
    if major? then return Key::MAJOR_KEYS end
    if minor? then return Key::MINOR_KEYS end
  end

  def relatives
    case quality
    when 'major'
      return Key::MINOR_KEYS
    when 'minor'
      return Key::MAJOR_KEYS
    else
      raise "unknown quality"
    end
  end

  def key_num
    hash = Hash[keys.map.with_index.to_a]
    hash[@key]
  end
end
