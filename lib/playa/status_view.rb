require 'playa/view'

module Playa
  class StatusView < View
    # def interface
    #   'status'
    # end

    # def path
    #   File.expand_path('../views/status.erb', __FILE__)
    # end

    private

    # def output
    #   self
    # end

    def output
      { 'status' => status }
    end

    def type
      :raw
    end

    def status
      [ "\u{25B2} Prev  \u{25BC} Next  \u{21B2} Select  \u{2395} Pause   Q Quit" ]
    end
  end
end
