module Playa
  class Controller
    include Vedeu

    event :complete do
      trigger(:_menu_next_, 'playlist')
      trigger(:_menu_select_, 'playlist')
      trigger(:select, trigger(:_menu_selected_, 'playlist'))
      trigger(:update)
    end

    event(:_initialize_) { trigger(:show_startup) }
    event(:select)       { |track| trigger(:play, track) }
    event(:show_startup) { StartupView.new.show }
    event(:show_help)    { HelpView.new.show }

    event :update do
      PlaylistView.new.show

      trigger(:_refresh_playlist_)
    end

    def initialize(args = [])
      @args   = args
      @player = Player.new
      @player.events.on(:position_change) { trigger(:progress_update) }
      @player.events.on(:complete)        { trigger(:complete) }

      event :show_player do
        trigger(:_clear_)

        PlaylistView.new.show
        StatusView.new.show
        ProgressView.new(@player).show

        trigger(:_refresh_group_player_)
      end

      event(:progress_update, { delay: 0.5 }) do
        ProgressView.new(@player).show

        trigger(:_refresh_progress_)
      end

      menu('playlist') { items(tracks) }
    end

    private

    attr_reader :args

    # Recursively traverses the directory passed as an argument, adding each
    # mp3 found to the track collection.
    def tracks
      @tracks ||= TrackCollection.new(args).tracks
    end

  end
end
