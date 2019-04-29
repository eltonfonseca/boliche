# Classe responsavel pelo teste dos frames
# @author Gean Matos

require 'minitest/autorun'

require_relative '../model/jogada'
require_relative '../model/frame'
require_relative '../model/jogador'

# Classe de teste
class FrameTeste < Minitest::Test
    # Constroi objetos para teste
    # @jogador [Jogador] jogador usado para teste
    # @pinos [Integer] quantidade de pinos iniciais
    # @pinos_jogada1 [Integer] pinos em pe no final da jogada1
    # @lance1 [Jogada] jogada utilizada no primeiro lancamento
    # @lance2 [Jogada] jogada utilizada no segundo lancamento
    # @jogadas [Array<Jogada>] Array de jogadas
    # @pinos_jogada2 [Integer] pinos em pe no final da jogada2 
    # @frame [Frame] Frame testado 
    def setup
        @jogador = Jogador.new('Felipe', 21, 1, 0, 1)
        @pinos = 10
        @lance1 = Jogada.new(@jogador, @pinos)
        @jogadas = Array.new(2)
        @pinos_jogada1 = @lance1.lancarBola
        @lance2 = Jogada.new(@jogador, @pinos_jogada1)
        @pinos_jogada2 = @lance2.lancarBola
        @jogadas[0] = @lance1
        @jogadas[1] = @lance2
        @frame = Frame.new(@jogadas)
        @frame.score
    end

    # Testa se houve spare
    def test_spare?
        assert = @frame.spare? == true or @frame.spare? == false
    end
    # Testa se houve strike
    def test_strike?
        assert = @frame.strike? == true or @frame.strike? == false
    end
    # Testa se o scoreTotal esta entre 0 e 300
    def test_score_entre_0_e_300
        assert = @frame.scoreTotal >= 0 and @frame.scoreTotal <= 300
    end
    # Testa se o score é maior que 300 ou menor que 0
    def test_score_menor_que_0_ou_maior_que_300
        assert_raises (ArgumentError) if @frame.scoreTotal < 0 and @frame.scoreTotal > 300
    end

    def clenup
        @jogador = nil
        @lance1 = nil
        @lance2 = nil
        @jogadas = nil 
    end
end