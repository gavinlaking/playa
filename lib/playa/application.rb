module Playa
  def self.log(message)
    Playa::Log.logger.debug(message)
  end

  class Application
    include Vedeu

    Vedeu.interface 'help' do
      colour  foreground: '#ffffff', background: '#000000'
      geometry do
        centred true
        height  9
        width   60
      end
      group   'help'
    end

    Vedeu.interface 'playlist' do
      colour  foreground: '#afd700', background: '#000000'
      geometry do
        width   60
        height  5
        centred true
      end
      group   'player'
    end

    Vedeu.interface 'progress' do
      colour  foreground: '#005aff', background: '#000000'
      geometry do
        width   60
        height  1
        y       { Vedeu.use('playlist').north(2) }
        x       { Vedeu.use('playlist').left }
        centred false
      end
      delay   1.0
      group   'player'
    end

    Vedeu.interface 'status' do
      colour  foreground: '#d70000', background: '#000000'
      geometry do
        width   60
        height  1
        y       { Vedeu.use('playlist').south(1) }
        x       { Vedeu.use('playlist').left }
        centred false
      end
      group   'player'
    end

    Vedeu.keymap('_global_') do
      key('p', 's')    { Vedeu.trigger(:show_player) }
      key('?')         { Vedeu.trigger(:show_help) }
      key(' ')         { Vedeu.trigger(:toggle) }   # pause/unpause
      key('h', :left)  { Vedeu.trigger(:rewind) }
      key('l', :right) { Vedeu.trigger(:forward) }

      key('k', :up) do
        Vedeu.trigger(:_menu_prev_, 'playlist')
        Vedeu.trigger(:update)
      end

      key('j', :down) do
        Vedeu.trigger(:_menu_next_, 'playlist')
        Vedeu.trigger(:update)
      end

      # key('m') do
      #   trigger(:_maximise_group_)
      # end

      key(:enter) do
        Vedeu.trigger(:_menu_select_, 'playlist')
        Vedeu.trigger(:select, Vedeu.trigger(:_menu_selected_, 'playlist'))
        Vedeu.trigger(:update)
      end
    end

    Vedeu.configure do
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
