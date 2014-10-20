module Playa
  class HelpView
    include Vedeu

    def show
      trigger(:_clear_)

      render do
        view 'help' do
          line do
            colour foreground: '#aadd00'
            stream do
              align centre
              width use('help').width
              text  'Wow, you found the really useful help page!'
            end
          end

          line ''

          line do
            colour foreground: '#ffffff'
            stream do
              align centre
              width use('help').width
              text 'Whilst a track is playing you can press:'
            end
          end

          line ''

          line do
            foreground('#ff0000') { text " \u{25C0}" }
            foreground('#ffffff') { text ' to rewind 5 seconds' }
          end

          line do
            foreground('#ff0000') { text " \u{25B6}" }
            foreground('#ffffff') { text ' to go forward 5 seconds' }
          end

          line ''
          line ''

          line do
            colour foreground: '#ffff00'
            stream do
              align centre
              width use('help').width
              text  'Press `p` to return to Playa.'
            end
          end
        end
      end
    end
  end
end
