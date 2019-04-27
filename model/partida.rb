# Classe responsável por introduzir a lógica do jogo, bem como suas regras de uma partida
# @author Elton Fonseca
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

    # Frames
    # @return [Array<Frame>] Frames de cada partida que são 10 + 2 ao todo
    attr_accessor :frames

    # Construtor
    # @param jogador [Jogador] Usuário jogador
    # @param dificuldade [Fixnum] Nível de dificuldade
    def initialize(jogador, dificuldade)
        @jogadores = Array.new(2)
        @jogadores[0] = jogador
        @placares = Placar.new(2)
        @dificuldade = dificuldade
        @frames = Frame.new(12)
    end
end