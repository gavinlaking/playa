module Playa
  class Application
    include Vedeu

    interface 'help' do
      centred true
      colour  foreground: '#ffffff', background: '#000000'
      cursor  false
      group   'help'
      height  9
      width   60
    end

    interface 'playlist' do
      colour  foreground: '#afd700', background: '#000000'
      cursor  false
      width   60
      height  5
      centred true
      group   'player'
    end

    interface 'progress' do
      colour  foreground: '#005aff', background: '#000000'
      cursor  false
      width   60
      height  1
      y       { use('playlist').north(2) }
      x       { use('playlist').left }
      centred false
      delay   1.0
      group   'player'
    end

    interface 'status' do
      colour  foreground: '#d70000', background: '#000000'
      cursor  false
      width   60
      height  1
      y       { use('playlist').south(1) }
      x       { use('playlist').left }
      centred false
      group   'player'
    end

    def self.start(args = [])
      Controller.new(args)

      Vedeu::Launcher.new(args).execute!
    rescue Errno::EMFILE
      puts "Playa does not support this number of files."
      puts "Please see https://github.com/gavinlaking/playa/issues/11"
    end
  end
end
