module Playa
  class Controller
    include Vedeu

    event :complete do
      trigger(:_menu_next_, 'playlist')
      trigger(:_menu_select_, 'playlist')
      trigger(:select, trigger(:_menu_selected_, 'playlist'))
      trigger(:update)
    end

    event :_initialize_ do
      trigger(:show_startup)
    end

    event :key do |key|
      case key
      when :left, 'h'   then trigger(:rewind)
      when :right, 'l'  then trigger(:forward)
      when ' '          then trigger(:toggle)
      when :up, 'k'     then
        trigger(:_menu_prev_, 'playlist')
        trigger(:update)

      when :down, 'j'   then
        trigger(:_menu_next_, 'playlist')
        trigger(:update)

      when '?'          then trigger(:show_help)
      when 'p', 's'     then trigger(:show_player)
      when 'q'          then trigger(:_exit_)
      when :enter       then
        trigger(:_menu_select_, 'playlist')
        trigger(:select, trigger(:_menu_selected_, 'playlist'))
        trigger(:update)

      end
    end

    event :select do |track|
      trigger(:play, track)
    end

    event :update do
      PlaylistView.render
      trigger(:_refresh_playlist_)
    end

    def initialize(args = [])
      @args   = args

      @player = Player.new
      @player.events.on(:position_change) { trigger(:progress_update) }
      @player.events.on(:complete)        { trigger(:complete) }

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
        PlaylistView.render
        StatusView.render
        ProgressView.render(@player)
        trigger(:_refresh_group_player_)
      end

      event(:progress_update, { delay: 0.5 }) do
        ProgressView.render(@player)
        trigger(:_refresh_progress_)
      end

      menu('playlist') { items(tracks) }
    end

    private

    attr_reader :args

    def tracks
      @tracks ||= TrackCollection.new(args).tracks
    end

  end
end
