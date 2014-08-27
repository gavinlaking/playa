require 'test_helper'

module Playa
  describe ProgressView do
    describe '#render' do
      describe 'when there is no track loaded' do
        let(:player) { Player.new }

        it 'returns output suitable for Vedeu to parse' do
          ProgressView.new(player).render.must_equal(
            {
              interfaces: [
                {
                  name: "progress",
                  group: "",
                  lines: [
                    {
                      colour: {},
                      streams: [
                        {
                          colour: {},
                          style: [],
                          text: " ",
                          width: 60,
                          align: :left
                        }
                      ],
                      style: []
                    }
                  ],
                  colour: {},
                  style: "",
                  geometry: {},
                  cursor: true,
                  delay: 0.0
                }
              ]
            }
          )
        end
      end

      describe 'when there is a track loaded' do
        it 'returns output suitable for Vedeu to parse' do
          skip
        end
      end
    end
  end
end
