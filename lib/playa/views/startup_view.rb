module Playa
  class StartupView < Vedeu::View
    def render
      views do
        view 'progress' do
          line do
            text 'Welcome to Playa.'
          end
        end
        view 'playlist' do
          line do
            text 'An mp3 player in your console.'
          end
        end
        view 'status' do
          line do
            text 'Press `s` to begin.'
          end
        end
      end
    end
  end
end
