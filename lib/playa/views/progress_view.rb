module Playa
  class ProgressView < Vedeu::View
    def output
      if object.track
        track_loaded

      else
        no_track_loaded

      end
    end

    private

    def track_loaded
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

    def no_track_loaded
      view 'progress' do
        line do
          stream do
            width view_width
            text  ' '
          end
        end
      end
    end

    def progress_width
      view_width - timer_width - 1
    end

    def progress_bar
      "\u{25FC}" * (object.progress * progress_width).ceil
    end

    def timer_width
      timer.size + 1
    end

    def timer
      remaining = (object.track.duration - object.counter).floor
      mm, ss    = remaining.divmod(60)
      hh, mm    = mm.divmod(60)
      mins      = mm.to_s.rjust(2, '0')
      secs      = ss.to_s.rjust(2, '0')

      [mins, secs].join(":")
    end

    def view_width
      @_width ||= Vedeu.use('progress').width
    end
  end
end
