module Playa
  class StatusView
    include Vedeu

    def show
      render do
        view 'status' do
          line do
            foreground('#ff0000') { text " \u{25B2}" }
            foreground('#ffffff') { text ' Prev  ' }

            foreground('#ff0000') { text "\u{25BC}" }
            foreground('#ffffff') { text ' Next  ' }

            foreground('#ff0000') { text "\u{21B2}" }
            foreground('#ffffff') { text ' Play  ' }

            foreground('#ff0000') { text "\u{2395}" }
            foreground('#ffffff') { text ' Pause  ' }

            foreground('#ff0000') { text 'Q' }
            foreground('#ffffff') { text ' Quit  ' }
          end
        end
      end
    end

  end
end
