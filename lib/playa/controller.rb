require 'playa/views/help_view'
require 'playa/views/playlist_view'
require 'playa/views/progress_view'
require 'playa/views/status_view'
require 'playa/views/startup_view'

module Playa
  class Controller
    include Vedeu

    def initialize(args = [])
      @player = Player.new

      event :_initialize_ do
        trigger(:show_startup)
      end

      event :show_startup do
        trigger(:_clear_)

        StartupView.render

        trigger(:_refresh_group_player_)
      end

      event :show_help do
        trigger(:_clear_)

        HelpView.render

        trigger(:_refresh_help_)
      end

      event :show_player do
        trigger(:_clear_)

        PlaylistView.render(menu)
        StatusView.render
        ProgressView.render(@player)

        trigger(:_refresh_group_player_)
      end

      event :update do
        PlaylistView.render(menu)
        trigger(:_refresh_playlist_)
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
        when :left, 'h'  then trigger(:rewind)
        when :right, 'l' then trigger(:forward)
        when ' '    then trigger(:toggle)
        when :up, 'k' then
          trigger(:menu_prev)
          trigger(:update)
        when :down, 'j' then
          trigger(:menu_next)
          trigger(:update)
        when '?' then trigger(:show_help)
        when 'p', 's' then trigger(:show_player)
        when 'q' then trigger(:_exit_)
        when :enter
          trigger(:menu_select)
          trigger(:select, menu.current_item)
          trigger(:update)
        end
      end

      @player.events.on(:position_change) { trigger(:progress_update) }
      @player.events.on(:complete)        { trigger(:complete) }

      @args = args
      trigger(:show_startup)
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
