require 'playa/track'

module Playa
  class TrackCollection
    def initialize; end

    def tracks
      @_tracks ||= files.inject([]) do |acc, file|
        acc << Track.new(file)
        acc
      end
    end

    def files
      @_files ||= Dir.glob(recursive).select do |file|
        File.file?(file)
      end
    end

    private

    def recursive
      directory + '/**/*'
    end

    def directory
      '/Users/gavinlaking/Music/playa'
    end
  end
end
