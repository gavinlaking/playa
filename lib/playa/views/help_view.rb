module Playa
  class HelpView < Vedeu::View
    def render
      view 'help' do
        line do
          text 'Help!'
        end
      end
    end
  end
end
