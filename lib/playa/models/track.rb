module Playa
  class Track
    def initialize(file)
      @file = file
    end

    def attributes
      {
        filename:     filename,
        title:        title,
        artist:       artist,
        album:        album,
        track_number: track_number,
        duration:     duration,
        bitrate:      bitrate
      }
    end

    def filename
      id_tags.filename
    end

    def title
      id_tags.tag.title || filename # TODO: this will include the path
    end

    def artist
      id_tags.tag.artist || ''
    end

    def album
      id_tags.tag.album || ''
    end

    def track_number
      id_tags.tag.tracknum || 0
    end

    def duration
      id_tags.length || 0
    end

    def bitrate
      id_tags.bitrate || 0
    end

    private

    attr_reader :file

    def id_tags
      @_id_tags ||= Mp3Info.open(file)
    end
  end
end
