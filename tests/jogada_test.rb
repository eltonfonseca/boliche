# Classe responsavel pelo teste das jogadas
# @Author Felipe Hercules

require 'minitest/autorun'

require_relative '../model/jogada'
require_relative '../model/jogador'

# Classe de teste
class JogadaTest < Minitest::Test
    # Constroi objetos para teste
    # @jogador [Jogador] jogador usado para teste
    # @pinos [Integer] quantidade de pinos iniciais
    # @lance1 [Jogada] jogada utilizada no primeiro lancamento
    # @pinos_jogada1 [Integer] pinos em pe no final da jogada1
    # @lance2 [Jogada] jogada utilizada no segundo lancamento
    # @pinos_jogada1 [Integer] pinos em pe no final da jogada2     
    def setup
        @jogador = Jogador.new('Felipe', 21, 1, 0, 1)
        @pinos = 10
        @lance1 = Jogada.new(@jogador, @pinos)
        @pinos_jogada1 = @lance1.lancarBola
        @lance2 = Jogada.new(@jogador, @pinos_jogada1)
        @pinos_jogada2 = @lance2.lancarBola
    end

    # Testa se os pinos em pe no final da jogada1 estao entre 0 e 10
    def test_pinos_jogada_1_deve_estar_entre_0_e_10
        assert = @pinos_jogada1 >=0 and @pinos_jogada1 <= 10       
    end
    # Testa se os pinos em pe no final da jogada2 estao entre 0 e pinos_jogada1
    def test_pinos_jogada_2_deve_estar_entre_0_e_pinos_jogada1
        assert @pinos_jogada2 >= 0 and @pinos_jogada2 <= @pinos_jogada1
    end
    # Lanca argumento caso os pinos em pe no final da jogada1 forem menores que 0 ou maiores que 10 
    def test_jogada_1_menor_que_0_e_maior_que_10
        assert_raises (ArgumentError) if @pinos_jogada1 < 0 and @pinos_jogada1 > 10
    end
    # Lanca argumento caso os pinos em pe no final da jogada2 forem menores que 0 ou maiores que pinos_jogada1
    def test_jogada_2_menor_que_0_e_maior_que_jogada_1
        assert_raises (ArgumentError) if @pinos_jogada2 < 0 and @pinos_jogada2 > @pinos_jogada1
    end
    # Zera objetos jogador, lance1 e lance2
    def cleanup
        @jogador = nil
        @lance1 = nil
        @lance2 = nil
    end
end