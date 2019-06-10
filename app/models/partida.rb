class Partida
    
    attr_accessor :jogadores
    attr_accessor :placares
    attr_accessor :dificuldade

    def initialize(match)
        @jogadores = Array.new(2)
        @jogadores[0] = match.users[0]
        @jogadores[1] = match.users[1]
        @placares = Array.new(2)
        @placares[0] = Placar.new
        @placares[1] = Placar.new
    end
end
