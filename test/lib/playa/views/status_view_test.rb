require 'test_helper'

module Playa
  describe StatusView do
    describe '#show' do
      before do
        Vedeu::Terminal.console.stubs(:winsize).returns([39, 143])
        Vedeu::Terminal.console.stubs(:print)
      end

      it 'returns output suitable for Vedeu to parse' do
        StatusView.new.show.must_equal(
          [["\e[38;2;215;0;0m\e[48;2;0;0;0m\e[23;41H                                                            \e[23;41H\e[23;41H\e[38;2;255;0;0m ▲\e[38;2;255;255;255m Prev  \e[38;2;255;0;0m▼\e[38;2;255;255;255m Next  \e[38;2;255;0;0m↲\e[38;2;255;255;255m Play  \e[38;2;255;0;0m⎕\e[38;2;255;255;255m Pause  \e[38;2;255;0;0mQ\e[38;2;255;255;255m Quit  "]]
        )
      end
    end
  end
end
