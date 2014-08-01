module Playa
  NotImplemented = Class.new(StandardError)

  class View
    def self.render(object = nil)
      new(object).render
    end

    def initialize(object = nil)
      @object = object
    end

    def render
      Vedeu::View.render(type, output)
    end

    private

    attr_reader :object

    def output
      fail NotImplemented, 'Implement #output on your subclass of Playa::View.'
    end

    def type
      fail NotImplemented, 'Implement #type on your subclass of Playa::View.'
    end
  end
end
