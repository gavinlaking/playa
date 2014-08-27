module Playa
  class TrackCollection
    def initialize(args = [])
      @args = args
    end

    def tracks
      @_tracks ||= files.reduce([]) do |acc, file|
        acc << Track.new(file)
        acc
      end
    end

    def files
      @_files ||= Dir.glob(recursive).select do |file|
        File.file?(file) && File.extname(file) == '.mp3'
      end
    end

    private

    attr_reader :args

    def recursive
      directory + '/**/*'
    end

    def directory
      args.first || '.'
    end
  end
end
