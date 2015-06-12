module Playa
  class PlaylistView
    include Vedeu
    include Playa::Helpers

    def show
      Vedeu.renders do
        view 'playlist' do
          playlist_menu.each do |sel, cur, item|
            if sel && cur
              line do
                stream do
                  width title_width(item)
                  text "\u{25B6}> #{item.title}"
                end

                stream do
                  width timer_width(item)
                  text  "#{timer(item)}"
                  align :right
                end
              end

            elsif cur
              line do
                stream do
                  width title_width(item)
                  text " > #{item.title}"
                end

                stream do
                  width timer_width(item)
                  text  "#{timer(item)}"
                  align :right
                end
              end

            elsif sel
              line do
                stream do
                  width title_width(item)
                  text "\u{25B6}  #{item.title}"
                end

                stream do
                  width timer_width(item)
                  text  "#{timer(item)}"
                  align :right
                end
              end

            else
              line do
                stream do
                  width title_width(item)
                  text "   #{item.title}"
                end

                stream do
                  width timer_width(item)
                  text  "#{timer(item)}"
                  align :right
                end
              end

            end
          end
        end
      end
    end

    private

    def title_width(item)
      view_width - timer_width(item) - 1
    end

    def timer_width(item)
      timer(item).size + 1
    end

    def timer(item)
      duration(item)
    end

    def view_width
      Vedeu.use('playlist').width
    end

    def playlist_menu
      @playlist_menu = Vedeu.trigger(:_menu_view_, 'playlist')
    end

  end
end
