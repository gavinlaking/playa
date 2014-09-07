require 'test_helper'

module Playa
  describe StatusView do
    describe '#render' do
      it 'returns output suitable for Vedeu to parse' do
        StatusView.new.render.must_equal(
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
                        align: :left,
                        parent: {
                          colour: {},
                          style: []
                        }
                      }, {
                        colour: {
                          foreground: "#ffffff"
                        },
                        style: [],
                        text: " Prev  ",
                        width: nil,
                        align: :left,
                        parent: {
                          colour: {},
                          style: []
                        }
                      }, {
                        colour: {
                          foreground: "#ff0000"
                        },
                        style: [],
                        text: "▼",
                        width: nil,
                        align: :left,
                        parent: {
                          colour: {},
                          style: []
                        }
                      }, {
                        colour: {
                          foreground: "#ffffff"
                        },
                        style: [],
                        text: " Next  ",
                        width: nil,
                        align: :left,
                        parent: {
                          colour: {},
                          style: []
                        }
                      }, {
                        colour: {
                          foreground: "#ff0000"
                        },
                        style: [],
                        text: "↲",
                        width: nil,
                        align: :left,
                        parent: {
                          colour: {},
                          style: []
                        }
                      }, {
                        colour: {
                          foreground: "#ffffff"
                        },
                        style: [],
                        text: " Select  ",
                        width: nil,
                        align: :left,
                        parent: {
                          colour: {},
                          style: []
                        }
                      }, {
                        colour: {
                          foreground: "#ff0000"
                        },
                        style: [],
                        text: "⎕",
                        width: nil,
                        align: :left,
                        parent: {
                          colour: {},
                          style: []
                        }
                      }, {
                        colour: {
                          foreground: "#ffffff"
                        },
                        style: [],
                        text: " Pause  ",
                        width: nil,
                        align: :left,
                        parent: {
                          colour: {},
                          style: []
                        }
                      }, {
                        colour: {
                          foreground: "#ff0000"
                        },
                        style: [],
                        text: "Q",
                        width: nil,
                        align: :left,
                        parent: {
                          colour: {},
                          style: []
                        }
                      }, {
                        colour: {
                          foreground: "#ffffff"
                        },
                        style: [],
                        text: " Quit  ",
                        width: nil,
                        align: :left,
                        parent: {
                          colour: {},
                          style: []
                        }
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
