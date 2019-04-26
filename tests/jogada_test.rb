require 'minitest/autorun'

require_relative '../model/jogada'
require_relative '../model/jogador'

class JogadaTest < Minitest::Test
    def setup
        @jogador = Jogador.new('Felipe', 21, 1, 0, 1)
        @pinos = 10
        @lance1 = Jogada.new(@jogador, @pinos)
        @pinos_jogada1 = @lance1.lancarBola
        @lance2 = Jogada.new(@jogador, @pinos_jogada1)
        @pinos_jogada2 = @lance2.lancarBola
        puts "pinos gerados:  #{@pinos}"
        puts "pinos derrubados jogada 1  #{@lance1.down_pin}"
        puts "pinos em pé na jogada 1    #{@lance1.up_pin}"
        puts "pinos derrubados jogada 2  #{@lance2.down_pin}"
        puts "pinos em pé na jogada 2    #{@lance2.up_pin}"


    end

    def test_pinos_jogada_1_deve_estar_entre_0_e_10
        assert = @pinos_jogada1 >=0 and @pinos_jogada1 <= 10       
    end

    def test_pinos_jogada_2_deve_estar_entre_0_e_pinos_jogada1
        assert @pinos_jogada2 >= 0 and @pinos_jogada2 <= @pinos_jogada1
    end

    def test_jogada_1_menor_que_0_e_maior_que_10
        assert_raises (ArgumentError) {@pinos_jogada1 < 0 and @pinos_jogada1 > 10}
    end

    def test_jogada_2_menor_que_0_e_maior_que_jogada_1
        assert_raises (ArgumentError) {@pinos_jogada2 < 0 and @pinos_jogada2 > @pinos_jogada1}
    end

    def cleanup
        @jogador = nil
        @lance1 = nil
        @lance2 = nil
    end
end