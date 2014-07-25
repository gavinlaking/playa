require 'test_helper'
require 'ostruct'

module Playa
  describe Track do
    let(:file) { '/some/path/electro.mp3' }
    let(:tag)  {
      OpenStruct.new({
        title:    'eee-lectro',
        artist:   'Gavin Laking + Various',
        album:    'That night at Sankeys',
        tracknum: 3,
      })
    }
    let(:mp3info) {
      OpenStruct.new({
        filename: '/some/path/electro.mp3',
        tag:      tag,
        length:   3623.0270625,
        bitrate:  320
      })
    }
    let(:track) { Track.new(file) }

    describe '#attributes' do
      it 'returns a collection of attributes' do
        Mp3Info.stub(:open, mp3info) do
          track.attributes.must_equal(
            {
              filename:     '/some/path/electro.mp3',
              title:        'eee-lectro',
              artist:       'Gavin Laking + Various',
              album:        'That night at Sankeys',
              track_number: 3,
              duration:     3623.0270625,
              bitrate:      320
            }
          )
        end
      end
    end

    describe '#filename' do
      it 'returns the filename' do
        Mp3Info.stub(:open, mp3info) do
          track.filename.must_equal('/some/path/electro.mp3')
        end
      end
    end

    describe '#title' do
      it 'returns the title' do
        Mp3Info.stub(:open, mp3info) do
          track.title.must_equal('eee-lectro')
        end
      end
    end

    describe '#artist' do
      it 'returns the artist' do
        Mp3Info.stub(:open, mp3info) do
          track.artist.must_equal('Gavin Laking + Various')
        end
      end
    end

    describe '#album' do
      it 'returns the album' do
        Mp3Info.stub(:open, mp3info) do
          track.album.must_equal('That night at Sankeys')
        end
      end
    end

    describe '#track_number' do
      it 'returns the track_number' do
        Mp3Info.stub(:open, mp3info) do
          track.track_number.must_equal(3)
        end
      end
    end

    describe '#duration' do
      it 'returns the duration' do
        Mp3Info.stub(:open, mp3info) do
          track.duration.must_equal(3623.0270625)
        end
      end
    end

    describe '#bitrate' do
      it 'returns the bitrate' do
        Mp3Info.stub(:open, mp3info) do
          track.bitrate.must_equal(320)
        end
      end
    end
  end
end
