require 'bundler/setup'
require 'vedeu'

require 'playa/track'
require 'playa/track_collection'
require 'playa/player'
require 'playa/controller'

module Playa
  class Application
    include Vedeu

    interface 'playlist' do
      colour  foreground: '#afd700', background: '#000000'
      cursor  false
      width   60
      height  5
      centred true
    end

    interface 'progress' do
      colour  foreground: '#005aff', background: '#000000'
      cursor  false
      width   60
      height  1
      y       use('playlist').north(2)
      x       use('playlist').left
      centred false
      delay   1.0
    end

    interface 'status' do
      colour  foreground: '#d70000', background: '#000000'
      cursor  false
      width   60
      height  1
      y       use('playlist').south(1)
      x       use('playlist').left
      centred false
    end

    def self.start(args = [])
      Controller.new(args)

      Vedeu::Launcher.new(args).execute!
    end
  end
end
