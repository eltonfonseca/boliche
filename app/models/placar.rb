class Placar < ApplicationRecord
    attr_reader :frames

    # Construtor
    def initialize
        @frames = Array.new(11)
    end
end
