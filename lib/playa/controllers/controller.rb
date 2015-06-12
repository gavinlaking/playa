module Playa
  class Controller
    include Vedeu

    Vedeu.bind(:complete) do
      Vedeu.trigger(:_menu_next_, 'playlist')
      Vedeu.trigger(:_menu_select_, 'playlist')
      Vedeu.trigger(:select, Vedeu.trigger(:_menu_selected_, 'playlist'))
      Vedeu.trigger(:update)
    end

    Vedeu.bind(:_initialize_) { Vedeu.trigger(:show_startup) }
    Vedeu.bind(:select)       { |track| Vedeu.trigger(:play, track) }
    Vedeu.bind(:show_startup) { StartupView.new.show }
    Vedeu.bind(:show_help)    { HelpView.new.show }

    Vedeu.bind :update do
      PlaylistView.new.show

      Vedeu.trigger(:_refresh_playlist_)
    end

    def initialize(args = [])
      @args   = args
      @player = Player.new
      @player.events.on(:position_change) { Vedeu.trigger(:progress_update) }
      @player.events.on(:complete)        { Vedeu.trigger(:complete) }

      Vedeu.bind(:show_player) do
        Vedeu.trigger(:_clear_)

        PlaylistView.new.show
        StatusView.new.show
        ProgressView.new(@player).show

        Vedeu.trigger(:_refresh_group_player_)
      end

      Vedeu.bind(:progress_update, { delay: 0.5 }) do
        ProgressView.new(@player).show

        Vedeu.trigger(:_refresh_progress_)
      end

      Vedeu.menu('playlist') { items(tracks) }
    end

    private

    attr_reader :args

    def tracks
      @tracks ||= TrackCollection.new(args).tracks
    end

  end
end
