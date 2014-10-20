module Playa
  def self.log(message)
    Playa::Log.logger.debug(message)
  end

  class Application
    include Vedeu

    interface 'help' do
      centred true
      colour  foreground: '#ffffff', background: '#000000'
      group   'help'
      height  9
      width   60
    end

    interface 'playlist' do
      colour  foreground: '#afd700', background: '#000000'
      width   60
      height  5
      centred true
      group   'player'
    end

    interface 'progress' do
      colour  foreground: '#005aff', background: '#000000'
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
      width   60
      height  1
      y       { use('playlist').south(1) }
      x       { use('playlist').left }
      centred false
      group   'player'
    end

    keys do
      key('p', 's')    { trigger(:show_player) }
      key('?')         { trigger(:show_help) }
      key(' ')         { trigger(:toggle) }   # pause/unpause
      key('h', :left)  { trigger(:rewind) }
      key('l', :right) { trigger(:forward) }

      key('k', :up) do
        trigger(:_menu_prev_, 'playlist')
        trigger(:update)
      end

      key('j', :down) do
        trigger(:_menu_next_, 'playlist')
        trigger(:update)
      end

      key(:enter) do
        trigger(:_menu_select_, 'playlist')
        trigger(:select, trigger(:_menu_selected_, 'playlist'))
        trigger(:update)
      end
    end

    configure do
      colour_mode 16777216
      interactive!
      raw!
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
