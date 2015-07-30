require_relative 'key'
require_relative 'key_factory'

GRAPH_CHAR = '*'


class MusicCollection < Array

  attr_accessor :count_for

  def initialize(exclude_major=false)
    @count_for = Hash.new
    (Key::MINOR_KEYS + Key::MAJOR_KEYS).each { |key| @count_for[key] = 0 }
    @tempos = Hash.new 0
    @exclude_major = exclude_major 
  end

  # def __len__(self):
  #   return sum(self.count_for.values())

  def add_track(track)
    self << track
    self.count_for[KeyFactory.key(track.to_s).to_s] += 1
    @tempos[track.bpm] += 1
  end

  #   def suitable_next_track_count(self, key):
  #       _key = KeyFactory.new(key)
  #       same = self.count_for[str(KeyFactory.new(key))]
  #       higher = self.count_for[_key.up_fifth]
  #       lower = self.count_for[_key.down_fifth]
  #       relative = self.count_for[_key.relative]
  #       return same + higher + lower + relative

  #   @property
  #   def keys_with_option_counts(self):
  #       for key, next_track_count in self.sorted_with_next_track_counts:
  #           if self.exclude_major and key in MAJOR_KEYS:
  #             continue
  #           else:
  #               if self.count_for[key] > 0:
  #                   candidates = self.suitable_next_track_count(key)
  #                   print "{:>3} {:5} tracks can be mixed into {:>3} other tracks: {}".format(self.count_for[key], key, candidates, GRAPH_CHAR * candidates)

  #   @property
  #   def keys_with_counts(self):
  #     keys = self.sorted_minor_keys if self.exclude_major else self.sorted_keys
  #     for key, count in keys:
  #         print "{:>3} {:5} tracks: {}".format(count, key, GRAPH_CHAR * count)

  #   @property
  #   def tempos_with_counts(self):
  #       for tempo, count in self.sorted_tempos:
  #           print "{:>3} {:5}bpm tracks: {}".format(count, tempo, GRAPH_CHAR * count)

  #   @property
  #   def sorted_tempos(self):
  #       return sorted(self.tempos.iteritems(), key=itemgetter(1))

  #   @property
  #   def sorted_keys(self):
  #       return sorted(self.count_for.iteritems(), key=itemgetter(1))

  #   @property
  #   def sorted_minor_keys(self):
  #       sorted_keys = sorted(self.count_for.iteritems(), key=itemgetter(1))
  #       return [key for key in sorted_keys if key[0] not in MAJOR_KEYS]

  #   @property
  #   def sorted_with_next_track_counts(self):
  #     keys = self.sorted_minor_keys if self.exclude_major else self.sorted_keys
  #     return sorted([(key, self.suitable_next_track_count(key)) for key, count in keys], key=itemgetter(1))
end
