# Classe responsável por introduzir a lógica do jogo, bem como suas regras de uma partida
# @author Gean Matos
class Partida

    # Jogadores
    # @return [Array<Jogador>] Jogadores que estão na partida
    attr_accessor :jogadores
    
    # Placares
    # @return [Array<Placar>] Placares dos jogadores da partida
    attr_accessor :placares
    
    # Dificuldade
    # @return [Fixnum] Nível de dificuldade
    attr_accessor :dificuldade
    
    # Construtor
    # @param jogador [Jogador] Usuário jogador
    # @param dificuldade [Fixnum] Nível de dificuldade
    def initialize(match)
        @jogadores = Array.new(2)
        @jogadores[0] = match.users[0]
        @jogadores[1] = match.users[1]
        @placares = Array.new(2)
        @placares[0] = Placar.new
        @placares[1] = Placar.new
    end
end
