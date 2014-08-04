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
      '|' * (object.progress * view_width).ceil
    end


    # TODO: playa knows too much here...
    def view_width
      @_width ||= Vedeu.view('progress').geometry.width
    end
  end
end
