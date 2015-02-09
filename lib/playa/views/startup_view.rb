module Playa
  class StartupView

    def show
      Vedeu.trigger(:_clear_)

      Vedeu.renders do
        view 'progress' do
          lines do
            centre 'Welcome to Playa.', width: Vedeu.use('progress').width
          end
        end

        view 'playlist' do
          lines do
            line ''
            line ''
            line 'Playa is a simple, interactive mp3 player for your terminal.'
          end
        end

        view 'status' do
          lines do
            centre 'Press `s` to begin.', width: Vedeu.use('progress').width
          end
        end
      end
    end

  end
end
