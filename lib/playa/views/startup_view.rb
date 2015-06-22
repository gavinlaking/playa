module Playa
  class StartupView
    include Vedeu

    def show
      Vedeu.trigger(:_clear_)

      Vedeu.renders do
        view 'progress' do
          line do
            stream do
              text  'Welcome to Playa.'
              align centre
              width use('progress').width
            end
          end
        end

        view 'playlist' do
          line ''
          line ''
          line 'Playa is a simple, interactive mp3 player for your terminal.'
        end

        view 'status' do
          line do
            stream do
              text  'Press `s` to begin.'
              align centre
              width use('progress').width
            end
          end
        end
      end
    end

  end
end
