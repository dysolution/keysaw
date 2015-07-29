class KeyFactory

    @classmethod
    def new(self, key):
        if key == '':
            return NullKey()

        if self._is_abbreviation(key):
            for full in MINOR_KEYS:
                if full.startswith(key):
                    return Key(full)
            return NullKey()

        if self._is_valid(key):
            return Key(key)
        else:
            return NullKey()

    # private
    @classmethod
    def _is_abbreviation(self, key):
        return len(key) < 4

    @classmethod
    def _is_valid(self, key):
        return key in MINOR_KEYS + MAJOR_KEYS
