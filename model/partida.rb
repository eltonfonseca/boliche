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

    # Construtor
    # @param jogador [Jogador] Usuário jogador
    # @param dificuldade [Fixnum] Nível de dificuldade
    def initialize(jogador, dificuldade)
        @jogadores = Array.new(2)
        @jogadores[0] = jogador
        @jogadores[1] = criaBOT(dificuldade)
        @placares = Array.new(2)
        @dificuldade = dificuldade      
    end
    
    def criaBOT(dificuldade)
        ran = rand(3) + 1
        case dificuldade
        when 1
            case ran
            when 1
                nome  = "Michael Faraday"
                idade = 76
            when 2
                nome  = "Ada Lovelace"
                idade = 36
            when 3
                nome  = "Carl Sagan"
                idade = 62
            end
        when 2
            case ran
            when 1
                nome  = "Steve Jobs"
                idade = 56
            when 2
                nome  = "Marie Curie"
                idade = 66
            when 3
                nome  = "Alan Turing"
                idade = 41
            end
        when 3
            case ran
            when 1
                nome  = "Eratóstenes"
                idade = 82
            when 2
                nome  = "Charles Babbage"
                idade = 79
            when 3
                nome  = "Edsger Dijkstra"
                idade = 72
            end
        when 4
            case ran
            when 1
                nome  = "Nikola Tesla"
                idade = 86
            when 2
                nome  = "Albert Einstein"
                idade = 76
            when 3
                nome  = "Stephen Hawking"
                idade = 76
            end
        end
        bot = Jogador.new(nome, idade, 0, 0, 2)
    end  

    def atualizaPlacares(index, jogador)
        if placares[jogador].frames[index - 2].spare?
            placares[jogador].frames[index - 2].scoreTotal = placares[jogador].frames[index - 2].score + placares[jogador].frames[index - 1].jogadas[0].down_pin
            puts "if 1 - #{placares[jogador].frames[index - 2].scoreTotal}"
        end
        if placares[jogador].frames[index - 2].strike? && !placares[jogador].frames[index - 1].strike?
            placares[jogador].frames[index - 2].scoreTotal = placares[jogador].frames[index - 2].score + placares[jogador].frames[index - 1].score
            puts "if 2 - #{placares[jogador].frames[index - 2].scoreTotal}"
        end
        if placares[jogador].frames[index - 2].strike? && placares[jogador].frames[index - 1].strike?
            placares[jogador].frames[index - 2].scoreTotal = placares[jogador].frames[index - 2].score + placares[jogador].frames[index - 1].score + placares[jogador].frames[index].jogadas[0].down_pin
            puts "if 3 - #{placares[jogador].frames[index - 2].scoreTotal}"
        end
        if index == 9
            if placares[jogador].frames[index - 1].spare?
                placares[jogador].frames[index - 1].scoreTotal = placares[jogador].frames[index - 1].score + placares[jogador].frames[index].jogadas[0].down_pin
                puts "if dentro do 9 - 1 - #{placares[jogador].frames[index - 1].scoreTotal}"
            end
            if placares[jogador].frames[index - 1].strike? && !placares[jogador].frames[index].strike?
                placares[jogador].frames[index - 1].scoreTotal = placares[jogador].frames[index - 1].score + placares[jogador].frames[index].score
                puts "if dentro do 9 - 1 - #{placares[jogador].frames[index - 1].scoreTotal}"
            end
            if placares[jogador].frames[index - 1].strike? && placares[jogador].frames[index].strike?
                placares[jogador].frames[index - 1].scoreTotal = placares[jogador].frames[index - 1].score + placares[jogador].frames[index].score + placares[jogador].frames[index + 1].jogadas[0].down_pin
                puts "if dentro do 9 - 1 - #{placares[jogador].frames[index - 1].scoreTotal}"
            end
            if placares[jogador].frames[index].strike?
                placares[jogador].frames[index].scoreTotal = placares[jogador].frames[index].score + placares[jogador].frames[index + 1].score
                puts "if dentro do 9 - 1 - #{placares[jogador].frames[index - 1].scoreTotal}"
            end
        end
    end
end
