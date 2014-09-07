require 'test_helper'

module Playa
  describe HelpView do
    describe '#render' do
      it 'returns output suitable for Vedeu to parse' do
        HelpView.new.render.must_equal(
          {
            interfaces: [
              {
                name:  "help",
                group: "",
                lines: [
                  {
                    colour:  {},
                    streams: [
                      {
                        text: "Help!"
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