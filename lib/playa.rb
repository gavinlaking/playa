require 'bundler/setup'
require 'vedeu'

require 'playa/track'
require 'playa/track_collection'
require 'playa/player'
require 'playa/view'
require 'playa/controller'

module Playa
  class Application
    include Vedeu

    playlist = interface 'playlist' do
      colour  foreground: '#afd700', background: '#000000'
      cursor  false
      width   60
      height  5
      centred true
    end

    interface 'status' do
      colour  foreground: '#d70000', background: '#000000'
      cursor  false
      width   60
      height  1
      y       playlist.geometry.bottom + 1
      x       playlist.geometry.left
      centred false
    end

    def self.start(args = [])
      Controller.new(args)

      Vedeu::Launcher.new(args).execute!
    end
  end
end
