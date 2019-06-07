class JogadaController < ApplicationController

  def new

    @match = Match.find(params[:match_id])
    @jogadores = Array.new(2)
    @jogadores[0] = @match.users[0]
    @jogadores[1] = @match.users[1]
    i = cookies[:i].to_i

    if i == 0
      @@list = Array.new
    end

    partida = Partida.new(@match)
    jogadasJogador0 = Array.new(2)
    jogadasJogador0[0] = Jogada.new(10)
    jogadasJogador0[0].lancarBola
    frameJogador0 = Frame.new(jogadasJogador0)
    if !frameJogador0.strike?
      jogadasJogador0[1] = Jogada.new(jogadasJogador0[0].up_pin)
      jogadasJogador0[1].lancarBola
      frameJogador0.jogadas = jogadasJogador0
       
      if !frameJogador0.spare?
        # todo
      else
        # todo
      end

    else
      frameJogador0.jogadas[1] = Jogada.new(10)
      frameJogador0.jogadas[1].down_pin = 0
      partida.placares[0].frames[i] = frameJogador0
      

    end
    partida.placares[0].frames[i] = frameJogador0


#### player 2

    jogadasJogador1 = Array.new(2)
    jogadasJogador1[0] = Jogada.new(10)
    jogadasJogador1[0].lancarBola
    frameJogador1 = Frame.new(jogadasJogador1)
    if !frameJogador1.strike?
      jogadasJogador1[1] = Jogada.new(jogadasJogador1[0].up_pin)
      jogadasJogador1[1].lancarBola
      frameJogador1.jogadas = jogadasJogador1
       
      if !frameJogador1.spare?
        # todo
      else
        # todo
      end

    else
      frameJogador1.jogadas[1] = Jogada.new(10)
      frameJogador1.jogadas[1].down_pin = 0
      partida.placares[0].frames[i] = frameJogador1
      

    end
    partida.placares[1].frames[i] = frameJogador1


    @@list.push(
      [[frameJogador0.jogadas[0].down_pin, frameJogador0.jogadas[1].down_pin, frameJogador0.score],
      [frameJogador1.jogadas[0].down_pin, frameJogador1.jogadas[1].down_pin, frameJogador1.score]]
      )


    render json: @@list
    cookies[:i] = cookies[:i].to_i + 1

  end
end
