require 'audite'

module Playa
  class Player
    include Vedeu

    def initialize
      event(:forward) { forward if playing? }
      event(:rewind)  { rewind if playing? }
      event(:toggle)  { toggle }
      event(:play) do |track|
        stop if playing?

        open(track)

        play
      end
    end

    def play
      player.start_stream
    end

    def stop
      player.stop_stream
    end

    def rewind
      player.rewind(5)
    end

    def forward
      player.forward(5)
    end

    def toggle
      if playing?
        stop
      else
        play
      end
    end

    def playing?
      player.active || false
    end

    def counter
      player.position
    end

    def progress
      if playing?
        counter / @track.duration
      else
        0
      end
    end

    def level
      player.level
    end

    def events
      player.events
    end

    def track
      @track
    end

    private

    def open(track)
      @track = track

      player.load(track.filename)
    end

    def player
      @_player ||= Audite.new
    end
  end
end
