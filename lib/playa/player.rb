require 'audite'

module Playa
  class Player
    attr_reader :track

    def self.play(track)
      new(track).start
    end

    def initialize(track = nil)
      @track = track
    end

    def start
      open

      play
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
      player.toggle
    end

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

    def open
      player.load(track.filename)
    end

    def player
      @_player ||= Audite.new
    end
  end
end
