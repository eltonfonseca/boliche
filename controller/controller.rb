require_relative '../view/view'
require_relative '../model/jogador'
require_relative '../model/partida'
require_relative '../model/jogada'
require_relative '../model/frame'
require_relative '../model/placar'

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
        partida.placares[0] = Placar.new
        partida.placares[1] = Placar.new
        for i in 0..11
            jogadasJogador0 = Array.new(2)
            jogadasJogador0[0] = Jogada.new(partida.jogadores[0], 10)
            view.informaJogada(i, 1)
            view.jogar
            jogadasJogador0[0].lancarBola
            view.pontuacaoJogada(jogadasJogador0[0].down_pin)
            frameJogador0 = Frame.new(jogadasJogador0)
            if !frameJogador0.strike?
                view.informaJogada(i, 2)
                jogadasJogador0[1] = Jogada.new(partida.jogadores[0], jogadasJogador0[0].up_pin)
                view.jogar
                jogadasJogador0[1].lancarBola
                frameJogador0.jogadas = jogadasJogador0
                if !frameJogador0.spare?
                    view.showScore(frameJogador0.score)
                else
                    view.showSpare
                    
                end
            else
                view.showStrike
            end
            partida.placares[0].frames[i] = frameJogador0
        end
    end
end