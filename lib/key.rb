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

  MINOR_KEYS = %w('G#min D#min A#min Fmin Cmin Gmin Dmin Amin Emin Bmin F#min C#min')
  MAJOR_KEYS = %w('Bmaj F#maj C#maj G#maj D#maj A#maj Fmaj Cmaj Gmaj Dmaj Amaj Emaj')

  attr_accessor :key

  def quality
    if @key.lower.endswith('maj')
      return 'major'
    else if @key.lower().endswith('min')
      return 'minor'
    else
      raise "couldn't determine key quality: {@key}"
    end
  end

  # def can_be_followed_with(other)
  #   [@key, @relative, @up_fifth, @down_fifth].include?(other.key)
  # end

  # def up_fifth
  #   key_num < 11 ? keys[key_num + 1] : 0
  # end

  # def down_fifth
  #   key_num > 0 ? keys[key_num - 1] : 11
  # end

  # def relative
  #   return relatives[keys.index(@key)]
  # end

  # private

  # def keys
  #   if @quality == 'major'
  #     return Key::MAJOR_KEYS
  #   else if @quality == 'minor'
  #     return Key::MINOR_KEYS
  #   end
  # end

  # def relatives
  #   case @quality
  #   when 'major'
  #     return Key::MINOR_KEYS
  #   when 'minor'
  #     return Key::MAJOR_KEYS
  #   else
  #     raise "unknown quality"
  #   end
  # end

  # def key_num
  #   keys.index(@key)
  # end

  # def valid
  #   keys.include?(@key)
  # end
end
