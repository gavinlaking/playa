module Playa
  class Controller
    include Vedeu

    def initialize(args = [])
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
        when :left  then player.rewind
        when :right then player.forward
        when :space then player.toggle
        when :up    then trigger(:menu_prev)
        when :down  then trigger(:menu_next)
        when 'q'    then trigger(:_exit_)
        when :enter
          trigger(:menu_select)
          trigger(:select, menu.current_item)
        end
        trigger(:update)
      end

      @args = args
      @view = View.render(menu.items)
    end

    private

    attr_reader :args

    def menu
      @_menu ||= Vedeu::Menu.new(tracks)
    end

    def tracks
      @_tracks ||= TrackCollection.new(args).tracks
    end

    def player
      @_player ||= Player.new
    end
  end
end
