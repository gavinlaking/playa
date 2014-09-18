require 'test_helper'

module Playa
  describe ProgressView do
    describe '#show' do
      before do
        Vedeu::Terminal.console.stubs(:winsize).returns([39, 143])
        Vedeu::Terminal.console.stubs(:print)
      end

      describe 'when there is no track loaded' do
        let(:player) { Player.new }

        it 'returns output suitable for Vedeu to parse' do
          ProgressView.new(player).show.must_equal(
            [["\e[38;2;0;90;255m\e[48;2;0;0;0m\e[15;41H                                                            \e[15;41H\e[15;41H                                                            "]]
          )
        end
      end

      describe 'when there is a track loaded' do
        it 'returns output suitable for Vedeu to parse' do
          skip
        end
      end
    end
  end
end
