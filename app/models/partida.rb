class Partida < ApplicationRecord
    
    attr_accessor :jogadores
    attr_accessor :placares
    attr_accessor :dificuldade

    def initialize(match)   
        @jogadores = Array.new(2)
        @jogadores[0] = match.users[0]
        @jogadores[1] = match.users[1]
        @placares = Array.new(2)  
        @placares[0] = Placar.new
        @placares[1] = Placar.new
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
