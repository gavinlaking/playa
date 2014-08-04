require 'playa/view'

module Playa
  class ProgressView < View
    private

    def output
      { 'progress' => [ progress ] }
    end

    def type
      :raw
    end

    def progress
      if object.track
        remaining = (object.track.duration - object.counter).floor
        mm, ss    = remaining.divmod(60)
        hh, mm    = mm.divmod(60)
        mins      = mm.to_s.rjust(2, '0')
        secs      = ss.to_s.rjust(2, '0')
        time      = [mins, secs].join(":")
        pwidth    = view_width - time.size - 1
        pbar      = '|' * (object.progress * pwidth).ceil

        {
          streams: [
            {
              text:  pbar,
              width: pwidth,
              align: :left
            }, {
              text:  time,
              width: time.size + 1,
              align: :right
            }
          ]
        }
      else
        { streams: [{ text: ' ', width: view_width }] }
      end
    end

    # TODO: playa knows too much here...
    def view_width
      @_width ||= Vedeu.view('progress').geometry.width
    end
  end
end
