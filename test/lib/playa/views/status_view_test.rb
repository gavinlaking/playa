require 'test_helper'

module Playa
  describe StatusView do
    describe '#output' do
      it 'returns output suitable for Vedeu to parse' do
        StatusView.new.output.must_equal(
          {
            interfaces: [
              {
                name: "status",
                group: "",
                lines: [
                  {
                    colour: {},
                    streams: [
                      {
                        colour: {
                          foreground: "#ff0000"
                        },
                        style: [],
                        text: " ▲",
                        width: nil,
                        align: :left
                      }, {
                        colour: {
                          foreground: "#ffffff"
                        },
                        style: [],
                        text: " Prev  ",
                        width: nil,
                        align: :left
                      }, {
                        colour: {
                          foreground: "#ff0000"
                        },
                        style: [],
                        text: "▼",
                        width: nil,
                        align: :left
                      }, {
                        colour: {
                          foreground: "#ffffff"
                        },
                        style: [],
                        text: " Next  ",
                        width: nil,
                        align: :left
                      }, {
                        colour: {
                          foreground: "#ff0000"
                        },
                        style: [],
                        text: "↲",
                        width: nil,
                        align: :left
                      }, {
                        colour: {
                          foreground: "#ffffff"
                        },
                        style: [],
                        text: " Select  ",
                        width: nil,
                        align: :left
                      }, {
                        colour: {
                          foreground: "#ff0000"
                        },
                        style: [],
                        text: "⎕",
                        width: nil,
                        align: :left
                      }, {
                        colour: {
                          foreground: "#ffffff"
                        },
                        style: [],
                        text: " Pause  ",
                        width: nil,
                        align: :left
                      }, {
                        colour: {
                          foreground: "#ff0000"
                        },
                        style: [],
                        text: "Q",
                        width: nil,
                        align: :left
                      }, {
                        colour: {
                          foreground: "#ffffff"
                        },
                        style: [],
                        text: " Quit  ",
                        width: nil,
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
  end
end
