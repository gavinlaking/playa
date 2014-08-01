require 'playa/view'

module Playa
  class StatusView < View
    private

    def output
      { 'status' => status }
    end

    def type
      :raw
    end

    def status
      [ "\u{25B2} Previous   \u{25BC} Next   \u{21B2} Select   \u{2395} Pause   Q Quit" ]
    end
  end
end
