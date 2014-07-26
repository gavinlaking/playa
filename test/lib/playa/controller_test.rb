require 'test_helper'
require 'playa/controller'

module Playa
  describe Controller do
    describe '#initialize' do
      it 'returns an instance of itself' do
        Controller.new.must_be_instance_of(Controller)
      end
    end
  end
end
