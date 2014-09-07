require 'test_helper'

module Playa
  describe StartupView do
    describe '#render' do
      it 'returns output suitable for Vedeu to parse' do
        StartupView.new.render.must_equal(
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
                        text: "Welcome to Playa."
                      }
                    ],
                    style: [],
                    parent: {
                      colour: {},
                      style: ''
                    }
                  }
                ],
                colour: {},
                style: "",
                geometry: {},
                cursor: true,
                delay: 0.0,
                parent: {}
              }, {
                name: "playlist",
                group: "",
                lines: [
                  {
                    colour: {},
                    streams: [
                      {
                        text: "An mp3 player in your console."
                      }
                    ],
                    style: [],
                    parent: {
                      colour: {},
                      style: ''
                    }
                  }
                ],
                colour: {},
                style: "",
                geometry: {},
                cursor: true,
                delay: 0.0,
                parent: {}
              }, {
                name: "status",
                group: "",
                lines: [
                  {
                    colour: {},
                    streams: [
                      {
                        text: "Press `s` to begin."
                      }
                    ],
                    style: [],
                    parent: {
                      colour: {},
                      style: ''
                    }
                  }
                ],
                colour: {},
                style: "",
                geometry: {},
                cursor: true,
                delay: 0.0,
                parent: {}
              }
            ]
          }
        )
      end
    end
  end
end
