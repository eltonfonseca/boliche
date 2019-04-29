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
        total = Array.new(12)
        score = Array.new(12)
        pontosJogada0 = Array.new(12)
        pontosJogada1 = Array.new(12)
        for i in 0..0  
            for j in 0..9
                pontosJogada0[j] = placares[i].frames[j].jogadas[0].down_pin
                pontosJogada1[j] = placares[i].frames[j].jogadas[1].down_pin
                score[j] = placares[i].frames[j].scoreTotal.to_s
                sum = 0
                for x in 0..j
                    sum += score[x].to_i
                end
                total[j] = sum
                for x in 0..11
                    if pontosJogada0[x] == 10
                        pontosJogada0[x] = "X"
                    end
                    if pontosJogada0[x] == 0
                        pontosJogada0[x] = "-"
                    end
                    if pontosJogada0[x] == nil
                        pontosJogada0[x] = "-"
                    end

                    if pontosJogada1[x] == 10
                        pontosJogada1[x] = "X"
                    end
                    if pontosJogada1[x] == 0
                        pontosJogada1[x] = "-"
                    end
                    if pontosJogada1[x] == nil
                        pontosJogada1[x] = "-"
                    end
                end
            end

            for j in 0..11
                if total[j].to_s.size == 1
                    total[j] = " " + total[j].to_s + "   "
                end
                if total[j].to_s.size == 2
                    total[j] = " " + total[j].to_s + "  "
                end
                if total[j].to_s.size == 3
                    total[j] = " " + total[j].to_s + " "
                end
            end

            puts "     _____________________________________________________________"
            puts "    |__1__|__2__|__3__|__4__|__5__|__6__|__7__|__8__|__9__|__10___|"
            puts "    |  #{pontosJogada0[0]}|#{pontosJogada1[0]}|  #{pontosJogada0[1]}|#{pontosJogada1[1]}|  #{pontosJogada0[2]}|#{pontosJogada1[2]}|  #{pontosJogada0[3]}|#{pontosJogada1[3]}|  #{pontosJogada0[4]}|#{pontosJogada1[4]}|  #{pontosJogada0[5]}|#{pontosJogada1[5]}|  #{pontosJogada0[6]}|#{pontosJogada1[6]}|  #{pontosJogada0[7]}|#{pontosJogada1[7]}|  #{pontosJogada0[8]}|#{pontosJogada1[8]}|  #{pontosJogada0[9]}|#{pontosJogada1[9]}| |"
            puts "    |#{total[0]}|#{total[1]}|#{total[2]}|#{total[3]}|#{total[4]}|#{total[5]}|#{total[6]}|#{total[7]}|#{total[8]}| #{total[9]} |"
            puts "    '-----'-----'-----'-----'-----'-----'-----'-----'-----'-------'"
        end
    end
end
