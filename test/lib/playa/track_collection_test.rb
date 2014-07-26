require 'test_helper'
require 'playa/track_collection'

module Playa
  describe TrackCollection do
    describe '#tracks' do
      it 'returns a collection of Track objects' do
        collection = TrackCollection.new
        collection.tracks.must_be_instance_of(Array)
        collection.tracks.first.must_be_instance_of(Track)
      end
    end

    describe '#files' do
      it 'returns a list of files for the specified directory' do
        files = [
          '/some/path/dance.mp3',
          '/some/path/electro.mp3',
          '/some/path/dubstep.mp3'
        ]
        collection = TrackCollection.new

        Dir.stub(:glob, files) do
          File.stub(:file?, true) do
            collection.files.must_equal(files)
          end
        end
      end
    end
  end
end
