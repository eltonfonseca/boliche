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
end
