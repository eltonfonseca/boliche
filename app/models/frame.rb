class Frame < ApplicationRecord
    attr_accessor :scoreTotal
    attr_accessor :jogadas

    def initialize(jogadas)
        @jogadas = jogadas
    end

    def strike?
        @jogadas[0].down_pin == 10
    end

    def spare?
        if !strike? && (@jogadas[0].down_pin + @jogadas[1].down_pin) == 10
            true
        else
            false
        end
    end

    def score
        @scoreTotal = @jogadas[0].down_pin + @jogadas[1].down_pin
    end
end
