require 'playa/view'

module Playa
  class PlaylistView < View
    include Vedeu

    private

    def type
      :dsl
    end

    def output
      view 'playlist' do
        self.object.view.each do |sel, cur, item|
          if sel && cur
            line { text "\u{25B6}> #{item.title}" }

          elsif cur
            line { text " > #{item.title}" }

          elsif sel
            line { text "\u{25B6}  #{item.title}" }

          else
            line { text "   #{item.title}" }

          end
        end
      end
    end
  end
end
