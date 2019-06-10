# Classe responsavel por cada frame do jogo
# @author Gean Matos
class Frame
    # Responsavel por armazenar o valor da pontuação total
    # @return [Fixnum] retorna o total do Score
    attr_accessor :scoreTotal
    attr_accessor :jogadas
    # Construtor
    # @param jogadas [Array<Jogada>] Jogadas que o jogador fez
    def initialize(jogadas)
        @jogadas = jogadas
    end
    
    # Pergunta se houve um Strike
    # @return [true, false] retorna true ou false se houve ou não um Strike
    
    def strike?
        @jogadas[0].down_pin == 10
    end
    
    # Pergunta se houve um Spare
    # @return [true, false] retorna true ou false se houve ou não um Spare
    
    def spare?
        if !strike? && (@jogadas[0].down_pin + @jogadas[1].down_pin) == 10
            true
        else
            false
        end
    end
    
    # Calcula o Score total das jogadas
    # @return [Fixnum] retorna o total de jogadas feitas
    
    def score
        @scoreTotal = @jogadas[0].down_pin + @jogadas[1].down_pin
    end
end
