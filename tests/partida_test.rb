# Classe responsavel por testar partida
# @author Gean Matos

require 'minitest/autorun'

require_relative '../model/jogador'
require_relative '../model/jogada'
require_relative '../model/placar'
require_relative '../model/partida'

class PartidaTest < Minitest::Test
    def setup
        @dificuldade = rand(3) + 1
        @jogador = Jogador.new('Felipe', 21, 1, 0, 1)
        @partida = Partida.new(@jogador, @dificuldade)
    end

    def test_criaBOT
        @bot = @partida.criaBOT(@dificuldade)
        assert @bot != nil
    end
end