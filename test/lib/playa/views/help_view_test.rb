require 'test_helper'

module Playa
  describe HelpView do
    describe '#show' do
      before do
        Vedeu::Terminal.console.stubs(:winsize).returns([39, 143])
        Vedeu::Terminal.console.stubs(:print)
      end

      it 'returns output suitable for Vedeu to parse' do
        HelpView.new.show.must_equal(
          [["\e[38;2;255;255;255m\e[48;2;0;0;0m\e[15;41H                                                            \e[15;41H\e[16;41H                                                            \e[16;41H\e[17;41H                                                            \e[17;41H\e[18;41H                                                            \e[18;41H\e[19;41H                                                            \e[19;41H\e[20;41H                                                            \e[20;41H\e[21;41H                                                            \e[21;41H\e[22;41H                                                            \e[22;41H\e[23;41H                                                            \e[23;41H\e[15;41H\e[38;2;170;221;0m        Wow, you found the really useful help page!         \e[38;2;170;221;0m\e[16;41H\e[17;41H\e[38;2;255;255;255m          Whilst a track is playing you can press:          \e[38;2;255;255;255m\e[18;41H\e[19;41H\e[38;2;255;0;0m ◀\e[38;2;255;255;255m to rewind 5 seconds\e[20;41H\e[38;2;255;0;0m ▶\e[38;2;255;255;255m to go forward 5 seconds\e[21;41H\e[22;41H\e[23;41H\e[38;2;255;255;0m               Press `p` to return to Playa.                \e[38;2;255;255;0m"]]
        )
      end
    end
  end
end
