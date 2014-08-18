module Playa
  class StatusView < Vedeu::View
    def output
      view 'status' do
        line do
          stream do
            colour foreground: '#ff0000'
            text   " \u{25B2}"
          end
          stream do
            colour foreground: '#ffffff'
            text   ' Prev  '
          end

          stream do
            colour foreground: '#ff0000'
            text   "\u{25BC}"
          end
          stream do
            colour foreground: '#ffffff'
            text   ' Next  '
          end

          stream do
            colour foreground: '#ff0000'
            text   "\u{21B2}"
          end
          stream do
            colour foreground: '#ffffff'
            text   ' Select  '
          end

          stream do
            colour foreground: '#ff0000'
            text   "\u{2395}"
          end
          stream do
            colour foreground: '#ffffff'
            text   ' Pause  '
          end

          stream do
            colour foreground: '#ff0000'
            text   "Q"
          end
          stream do
            colour foreground: '#ffffff'
            text   ' Quit  '
          end
        end
      end
    end
  end
end
