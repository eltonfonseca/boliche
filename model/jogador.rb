# Classe responsavel por cada jogador
# @author Felipe Hercules
class Jogador

    # Responsavel por armazenar nome, idade, quantidade 
    # de jogos e pontuação maxima de cada jogador

    # @return [String] retorna o nome do jogador
    attr_reader :nome 

    # @return [Integer] retorna a idade do jogador
    attr_reader :idade

    # @return [Integer] retorna a quantidade de partidas jogadas
    attr_reader :jogos

    # @return [Integer] retorna a maior pontuacao
    attr_reader :maxPontuacao

    # @return [Integer] retorna o tipo de jogador
    attr_reader :tipoJogador

    # @param nome [String] nome do jogador
    # @param idade [Integer] idade do jogador
    # @param jogos [Integer] quantidade de partidas jogadas
    # @param maxPontuacao [Integer] maior pontuação do jogador
    # @param tipoJogador [Integer] tipo de jogador
    def initialize(nome, idade, jogos, maxPontuacao, tipoJogador)
        @nome          = nome
        @idade         = idade
        @jogos         = jogos
        @maxPontuacao  = maxPontuacao
        @tipoJogador   = tipoJogador
    end
end
