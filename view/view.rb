# Classe responsável por apresentar as informações do jogo
# @author Elton Fonseca
class View 

    # Construtor da Classe
    def initialize
        
    end

    def getNome
        puts "Digite o nome do jogador: "
        gets.chomp
    end

    def getIdade
        puts "Digite a sua idade: "
        gets.chomp.to_i()
    end

    def getDificuldade
        puts "Digite a dificuldade desejada: "
        puts "1 - Muito fácil"
        puts "2 - Fácil"
        puts "3 - Difícil"
        puts "4 - Muito difícil"
        gets.chomp.to_i()
    end

    def jogar
        loop do
            puts "Digite J para jogar"
            c = gets.to_s.chomp
            break if c.downcase == "j"
        end
    end

    def informaJogada(frame, jogada)
        puts "Jogada #{jogada} do frame #{frame + 1}"
    end

    def pontuacaoJogada(score)
        puts "Você fez #{score} pontos nessa jogada"
    end

    def showScore(score)
        puts "Seu score nesse frame foi: #{score}"
    end

    def showStrike
        puts "Você fez um Strike!"
    end

    def showSpare
        puts "Você fez um Spare!"
    end

    def pulaLinha
        puts 
    end

    def showPlacar(placares)
        score = Array.new(12)
        pontosJogada0 = Array.new(12)
        pontosJogada1 = Array.new(12)
        for i in 0..0  
            for j in 0..9
                if placares[i].frames[j].jogadas[0].down_pin == 10
                    pontosJogada0[j] = "X"
                else
                    pontosJogada0[j] = placares[i].frames[j].jogadas[0].down_pin
                end
                if placares[i].frames[j].jogadas[1].down_pin == 10
                    pontosJogada1[j] = "X"
                else
                    pontosJogada1[j] = placares[i].frames[j].jogadas[1].down_pin
                end
                if placares[i].frames[j].jogadas[0].down_pin == 0
                    pontosJogada0[j] = "-"
                else
                    pontosJogada0[j] = placares[i].frames[j].jogadas[0].down_pin
                end
                if placares[i].frames[j].jogadas[1].down_pin == 0
                    pontosJogada1[j] = "-"
                else
                    pontosJogada1[j] = placares[i].frames[j].jogadas[1].down_pin
                end
                if placares[i].frames[j].scoreTotal == 0
                    score[j] = "-"
                end
                if placares[i].frames[j].scoreTotal.to_s.size == 2
                    score[j] = " " + placares[i].frames[j].scoreTotal.to_s    
                end
                if placares[i].frames[j].scoreTotal.to_s.size == 1
                    score[j] = "  " + placares[i].frames[j].scoreTotal.to_s
                end
                if placares[i].frames[j].scoreTotal.to_s.size == 1
                    score[j] = placares[i].frames[j].scoreTotal.to_s
                end
            end
            puts "     _____________________________________________________________"
            puts "    |__1__|__2__|__3__|__4__|__5__|__6__|__7__|__8__|__9__|__10___|"
            puts "    |  #{pontosJogada0[0]}|#{pontosJogada1[0]}|  #{pontosJogada0[1]}|#{pontosJogada1[1]}|  #{pontosJogada0[2]}|#{pontosJogada1[2]}|  #{pontosJogada0[3]}|#{pontosJogada1[3]}|  #{pontosJogada0[4]}|#{pontosJogada1[4]}|  #{pontosJogada0[5]}|#{pontosJogada1[5]}|  #{pontosJogada0[6]}|#{pontosJogada1[6]}|  #{pontosJogada0[7]}|#{pontosJogada1[7]}|  #{pontosJogada0[8]}|#{pontosJogada1[8]}|  #{pontosJogada0[9]}|#{pontosJogada1[9]}|W|"
            puts "    |#{score[0]}  |#{score[1]}  |#{score[2]}  |#{score[3]}  |#{score[4]}  |#{score[5]}  |#{score[6]}  |#{score[7]}  |#{score[8]}  | #{score[9]}   |"
            puts "    '-----'-----'-----'-----'-----'-----'-----'-----'-----'-------'"
        end
    end
end
