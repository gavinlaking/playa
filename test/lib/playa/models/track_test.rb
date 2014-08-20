require 'test_helper'

module Playa
  describe Track do
    let(:file) { '/some/path/electro.mp3' }
    let(:tag)  do
      stub(
        title:    'eee-lectro',
        artist:   'Gavin Laking + Various',
        album:    'That night at Sankeys',
        tracknum: 3
      )
    end
    let(:mp3info) do
      stub(
        filename: '/some/path/electro.mp3',
        tag:      tag,
        length:   3623.0270625,
        bitrate:  320
      )
    end
    let(:track) { Track.new(file) }

    before do
      Mp3Info.stubs(:open).returns(mp3info)
    end

    describe '#initialize' do
      it 'returns an instance of itself' do
        Track.new(file).must_be_instance_of(Track)
      end
    end

    describe '#attributes' do
      it 'returns a collection of attributes' do
        track.attributes.must_equal(
          filename:     '/some/path/electro.mp3',
          title:        'eee-lectro',
          artist:       'Gavin Laking + Various',
          album:        'That night at Sankeys',
          track_number: 3,
          duration:     3623.0270625,
          bitrate:      320
        )
      end
    end

    describe '#filename' do
      it 'returns the filename' do
        track.filename.must_equal('/some/path/electro.mp3')
      end
    end

    describe '#title' do
      it 'returns the title' do
        track.title.must_equal('eee-lectro')
      end
    end

    describe '#artist' do
      it 'returns the artist' do
        track.artist.must_equal('Gavin Laking + Various')
      end
    end

    describe '#album' do
      it 'returns the album' do
        track.album.must_equal('That night at Sankeys')
      end
    end

    describe '#track_number' do
      it 'returns the track_number' do
        track.track_number.must_equal(3)
      end
    end

    describe '#duration' do
      it 'returns the duration' do
        track.duration.must_equal(3623.0270625)
      end
    end

    describe '#bitrate' do
      it 'returns the bitrate' do
        track.bitrate.must_equal(320)
      end
    end
  end
end
