module Playa
  class HelpView

    def show
      Vedeu.trigger(:_clear_)

      Vedeu.renders do
        view 'help' do
          lines do
            line do
              foreground '#aadd00'
              centre 'Wow, you found the really useful help page!', width: Vedeu.use('help').width
            end

            line ''

            line do
              foreground '#00ff00'
              centre 'Whilst a track is playing you can press:', width: Vedeu.use('help').width
            end

            line ''

            line do
              stream do
                foreground '#ff0000'
                text " \u{25C0}"
              end
              stream do
                foreground '#ffffff'
                text ' to rewind 5 seconds'
              end
            end

            line do
              stream do
                foreground '#ff0000'
                text " \u{25B6}"
              end
              stream do
                foreground '#ffffff'
                text ' to go forward 5 seconds'
              end
            end

            line ''
            line ''

            line do
              colour foreground: '#ffff00'
              centre 'Press `p` to return to Playa.', width: Vedeu.use('help').width
            end
          end
        end
      end
    end
  end
end
