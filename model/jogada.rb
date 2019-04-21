# Classe responsavel pelas Jogadas
# @author Elton Fonseca
class Jogada 

    # Pinos derrubados
    # @return [Fixnum] armazena um valor inteiro de pinos derrubados
    attr_reader :down_pin

    # Pinos que sobraram
    # @return [Fixnum] armazena um valor inteiro de pinos que sobraram
    attr_reader :up_pin

    # Construtor
    # @param jogador [Jogador] Jogador que fará a jogada
    # @param up_pin [Fixnum] Pinos que ainda estão de pé
    # @param down_pin [Fixnum] Pinos que foram derrubados
    def initialize(jogador, up_pin)
        @jogador = jogador
        @up_pin = up_pin
        @down_pin = 0
    end

    # Metodo responsavel pelo lançamento da bola
    # @return [void] Função atualiza valores das variáveis down_pin e up_pin 
    def lancarBola
        @down_pin = rand(@up_pin + 1)
        @up_pin = @up_pin - @down_pin
    end
end