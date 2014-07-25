module Playa
  class Controller
    include Vedeu

    def initialize
      event :update do
        @view = View.render(menu.items)
      end

      event :select do |track|
        player.stop

        @_player = Player.play(track)
      end

      event :complete do
        trigger(:menu_next)
        trigger(:select, menu.current_item)
      end

      event :key do |key|
        case key
        when :left
          player.rewind

        when :right
          player.forward

        when :space
          player.toggle

        when :enter
          trigger(:menu_select)
          trigger(:select, menu.current_item)

        when :up
          trigger(:menu_prev)

        when :down
          trigger(:menu_next)

        when 'q'
          trigger(:_exit_)

        end
        trigger(:update)
      end

      @view = View.render(menu.items)
    end

    private

    def menu
      @_menu ||= Vedeu::Menu.new(tracks)
    end

    def tracks
      @_tracks ||= TrackCollection.new.tracks
    end

    def player
      @_player ||= Player.new
    end
  end
end
