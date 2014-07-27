module Playa
  class View
    def self.render(menu)
      new(menu).render
    end

    def initialize(menu)
      @menu = menu
    end

    def render
      Vedeu::Parser.parse([ interface, playlist ])
    end

    private

    attr_reader :menu

    def playlist
      menu.map { |sel, cur, item| [ sel, cur, item.title ] }
    end

    def interface
      'playlist'
    end
  end
end
