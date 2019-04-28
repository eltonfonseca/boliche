require_relative '../view/view'
require_relative '../model/jogador'
require_relative '../model/partida'
require_relative '../model/jogada'
require_relative '../model/frame'
# Classe controladora, responsavel pelo intermédio entre a visão e os modelos
# @author Elton Fonseca
class Controller

    # Construtor da Classe
    def initialize
        view = View.new
        nome = view.getNome
        idade = view.getIdade
        dificuldade = view.getDificuldade
        jogador = Jogador.new(nome, idade, 0, 0, 1)
        partida = Partida.new(jogador, dificuldade)
        for i in 0..11
            jogadas = Array.new(2)
            
            jogadas[0] = Jogada.new(partida.jogadores[0], 10)
            view.informaJogada(i, 1)
            if view.jogar == "j"
                pin_up = jogadas[0].lancarBola
            end

            frame = Frame.new(jogadas)
            
            if !frame.strike?
                view.informaJogada(i, 2)
                jogadas[1] = Jogada.new(partida.jogadores[0], jogadas[0].up_pin)
                if view.jogar == "j"
                    pin_up = jogadas[1].lancarBola
                end
            end
            
            
        end

    end   
end


Controller.new()