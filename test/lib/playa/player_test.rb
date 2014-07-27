require 'test_helper'
require 'playa/player'

module Playa
  describe Player do
    describe '#initialize' do
      it 'returns an instance of itself' do
        Player.new.must_be_instance_of(Player)
      end
    end
  end
end
