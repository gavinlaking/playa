module Playa
  module Helpers
    def duration(track)
      human(track.duration.ceil)
    end

    def remaining(track, player)
      human((track.duration - player.counter).floor)
    end

    private

    def human(seconds)
      mm, ss    = seconds.divmod(60)
      hh, mm    = mm.divmod(60)
      mins      = mm.to_s.rjust(2, '0')
      secs      = ss.to_s.rjust(2, '0')

      [mins, secs].join(":")
    end
  end
end
