module Playa
  class View
    def self.render(output)
      new(output).render
    end

    def initialize(output)
      @output = output
    end

    def render
      Vedeu::Parser.parse(:menu, output)
    end

    private

    attr_reader :output
  end

  class PlaylistView < View
    private

    def output
      [ 'playlist', @output ]
    end
  end

  class StatusView < View
    private

    def output
      { 'status' => @output }
    end
  end
end
