module Playa
  class ProgressView
    include Vedeu
    include Playa::Helpers

    def initialize(player)
      @player = player
    end

    def show
      if player.track
        track_loaded

      else
        no_track_loaded

      end
    end

    private

    attr_reader :player

    def track_loaded
      render do
        view 'progress' do
          line do
            stream do
              width progress_width
              text  progress_bar
            end

            stream do
              width timer_width
              text  timer
              align :right
            end
          end
        end
      end
    end

    def no_track_loaded
      render do
        view 'progress' do
          line do
            stream do
              width view_width
              text  ' '
            end
          end
        end
      end
    end

    def progress_width
      view_width - timer_width - 1
    end

    def progress_bar
      "\u{25FC}" * (player.progress * progress_width).ceil
    end

    def timer_width
      timer.size + 1
    end

    def timer
      remaining(player.track, player)
    end

    def view_width
      Vedeu.use('progress').viewport_width
    end
  end
end
