module Playa
  class Controller
    include Vedeu

    def initialize(args = [])
      @player = Player.new

      event :update do
        @view = View.render(menu.view)
      end

      event :select do |track|
        trigger(:play, track)
      end

      event :complete do
        trigger(:menu_next)
        trigger(:select, menu.current_item)
      end

      event :key do |key|
        case key
        when :left  then trigger(:rewind)
        when :right then trigger(:forward)
        when ' '    then trigger(:toggle)
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
      @view = View.render(menu.view)
    end

    private

    attr_reader :args

    def menu
      @_menu ||= Vedeu::Menu.new(tracks)
    end

    def tracks
      @_tracks ||= TrackCollection.new(args).tracks
    end
  end
end
