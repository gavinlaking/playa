require 'test_helper'

module Playa
  class HelpersTest
    include Helpers
  end

  describe Helpers do
    let(:receiver) { HelpersTest.new }
    let(:track)    { mock('Track') }

    before { track.stubs(:duration).returns(4321.6543) }

    describe '#duration' do
      it 'returns a human readable version of the track duration' do
        receiver.duration(track).must_equal('12:02')
      end
    end

    describe '#remaining' do
      let(:player) { mock('Player') }

      before { player.stubs(:counter).returns(42) }

      it 'returns a human readable version of the remaining time for a ' \
         'playing track' do
        receiver.remaining(track, player).must_equal('11:19')
      end
    end
  end
end
