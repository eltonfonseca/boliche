class Jogada < ApplicationRecord
    
    attr_accessor :up_pin
    attr_accessor :down_pin

    def initialize(up_pin)
        @up_pin = up_pin
        @down_pin = 0
    end

    def lancarBola
        @down_pin = rand(@up_pin + 1)
        @up_pin = @up_pin - @down_pin
    end
end