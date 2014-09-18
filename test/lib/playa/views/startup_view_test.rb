require 'test_helper'

module Playa
  describe StartupView do
    describe '#show' do
      before do
        Vedeu::Terminal.console.stubs(:winsize).returns([39, 143])
        Vedeu::Terminal.console.stubs(:print)
      end

      it 'returns output suitable for Vedeu to parse' do
        StartupView.new.show.must_equal(
          [["\e[38;2;0;90;255m\e[48;2;0;0;0m\e[15;41H                                                            \e[15;41H\e[15;41H                     Welcome to Playa.                      "], ["\e[38;2;175;215;0m\e[48;2;0;0;0m\e[17;41H                                                            \e[17;41H\e[18;41H                                                            \e[18;41H\e[19;41H                                                            \e[19;41H\e[20;41H                                                            \e[20;41H\e[21;41H                                                            \e[21;41H\e[17;41H\e[18;41H\e[19;41HPlaya is a simple, interactive mp3 player for your terminal."], ["\e[38;2;215;0;0m\e[48;2;0;0;0m\e[23;41H                                                            \e[23;41H\e[23;41H                    Press `s` to begin.                     "]]
        )
      end
    end
  end
end
