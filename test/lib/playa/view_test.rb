require 'test_helper'
require 'playa/view'

module Playa
  describe View do
    describe '#initialize' do
      it 'returns an instance of itself' do
        menu = []
        View.new(menu).must_be_instance_of(View)
      end
    end
  end
end
