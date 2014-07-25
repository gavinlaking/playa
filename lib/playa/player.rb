require 'audite'

module Playa
  class Player
    def initialize(track, &block)
      @track = track
    end

    def load
      @_loaded ||= player.load(track.filename)
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

    def pause
      player.toggle
    end
    alias_method :unpause, :pause

    def playing?
      player.active || false
    end

    def counter
      player.position
    end

    def level
      player.level
    end

    private

    attr_reader :track

    def audite_events
    end

    def player
      @_player ||= Audite.new
    end
  end
end
