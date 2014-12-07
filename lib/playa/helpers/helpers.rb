module Playa
  module Helpers

    # Returns the track duration in a human readable form.
    #
    # @param track [Track]
    # @return [String]
    def duration(track)
      human(track.duration.ceil)
    end

    # Returns the remaining time of the playing track in a human readable form.
    #
    # @param track [Track]
    # @param player [Player]
    # @return [String]
    def remaining(track, player)
      human((track.duration - player.counter).floor)
    end

    private

    # Converts the seconds provided into a human readable time stamp.
    #
    # @param seconds [Fixnum]
    # @return [String]
    def human(seconds)
      mm, ss    = seconds.divmod(60)
      hh, mm    = mm.divmod(60)
      mins      = mm.to_s.rjust(2, '0')
      secs      = ss.to_s.rjust(2, '0')

      [mins, secs].join(":")
    end
  end
end
