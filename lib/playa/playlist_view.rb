require 'playa/view'

module Playa
  class PlaylistView < View
    private

    def output
      [ 'playlist', playlist ]
    end

    def type
      :menu
    end

    def playlist
      object.view.map { |sel, cur, item| [ sel, cur, item.title ] }
    end
  end
end
