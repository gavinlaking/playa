require 'test_helper'

module Playa
  describe Player do
    let(:player) { Player.new }
    let(:track)  { stub(filename: 'test/support/parkwalk.mp3') }

    describe '#initialize' do
      it 'returns an instance of itself' do
        Player.new.must_be_instance_of(Player)
      end
    end

    describe '#play' do
      it 'returns an instance of Portaudio' do
        player.play.must_be_instance_of(Portaudio)
      end
    end

    describe '#stop' do
      it 'returns nil when nothing is playing' do
        player.stop.must_be_instance_of(NilClass)
      end
    end

    describe '#rewind' do
      it '' do
        skip # spf
        player.rewind.must_be_instance_of(NilClass)
      end
    end

    describe '#forward' do
      it '' do
        skip # spf
        player.forward.must_be_instance_of(NilClass)
      end
    end

    describe '#toggle' do
      it '' do
        player.toggle.must_be_instance_of(Portaudio)
      end
    end

    describe '#playing?' do
      it 'returns false when nothing is playing' do
        player.playing?.must_be_instance_of(FalseClass)
      end

      it 'returns true when a track is playing' do
        skip
        player.playing?.must_be_instance_of(TrueClass)
      end
    end

    describe '#counter' do
      it '' do
        skip
        player.counter.must_be_instance_of(NilClass)
      end
    end

    describe '#level' do
      it 'returns the volume level of the audio currently under ' \
         'the play head' do
        player.level.must_be_instance_of(Float)
      end
    end
  end
end
