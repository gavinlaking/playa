require 'test_helper'
require 'playa/track_collection'

module Playa
  describe TrackCollection do
    describe '#initialize' do
      it 'returns an instance of itself' do
        TrackCollection.new.must_be_instance_of(TrackCollection)
      end
    end

    describe '#tracks' do
      it 'returns a collection of Track objects' do
        collection = TrackCollection.new
        collection.tracks.must_be_instance_of(Array)
        collection.tracks.first.must_be_instance_of(Track)
      end
    end

    describe '#files' do
      it 'returns an empty list of files when the directory ' \
         'contains no mp3s' do
        collection = TrackCollection.new(['/some/path'])
        Dir.stub(:glob, []) do
          collection.files.must_be_empty
        end
      end

      it 'returns only the mp3s when the directory contains ' \
         'multiple file types' do
        files = [
          '/some/path/dance.mp3',
          '/some/path/README.txt',
          '/some/path/dubstep.mp3'
        ]
        collection = TrackCollection.new(['/some/path'])
        Dir.stub(:glob, files) do
          File.stub(:file?, true) do
            collection.files.must_equal([
              '/some/path/dance.mp3',
              '/some/path/dubstep.mp3'
            ])
          end
        end
      end

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
