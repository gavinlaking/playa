require 'playa/views/playlist_view'
require 'playa/views/progress_view'
require 'playa/views/status_view'

module Playa
  class Controller
    include Vedeu

    def initialize(args = [])
      @player = Player.new

      event :update do
        PlaylistView.render(menu)
      end

      event :progress_update, 0.5 do
        ProgressView.render(@player)
        trigger(:_refresh_progress_)
      end

      event :select do |track|
        trigger(:play, track)
      end

      event :complete do
        trigger(:menu_next)
        trigger(:menu_select)
        trigger(:select, menu.current_item)
        trigger(:update)
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

      @player.events.on(:position_change) { trigger(:progress_update) }
      @player.events.on(:complete)        { trigger(:complete) }

      @args          = args
      @playlist_view = PlaylistView.render(menu)
      @status_view   = StatusView.render
      @progress_view = ProgressView.render(@player)
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
