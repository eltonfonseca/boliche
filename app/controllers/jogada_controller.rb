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
      partida.placares[1].frames[i] = frameJogador1
      

    end
    partida.placares[1].frames[i] = frameJogador1

    jogada1Jogador0 = frameJogador0.jogadas[0].down_pin
    jogada2Jogador0 = frameJogador0.jogadas[1].down_pin
    jogada1Jogador1 = frameJogador1.jogadas[0].down_pin
    jogada2Jogador1 = frameJogador1.jogadas[1].down_pin

    @@list.push(
      [[jogada1Jogador0, jogada2Jogador0, frameJogador0.score, spareOrStrike(jogada1Jogador0, jogada2Jogador0)],
      [ jogada1Jogador1, jogada2Jogador1, frameJogador1.score, spareOrStrike(jogada1Jogador1, jogada2Jogador1)]]
      )

    if i > 1
      @@list = atualizaPlacares(i, 0, @@list)
      @@list = atualizaPlacares(i, 1, @@list)
    end


    # if i == 9 
      
    #   if @@list[i][0][3] == 'strike'
    #     jogadaAdicionalJogador0 = Array.new(2)
    #     jogadaAdicionalJogador0[0] = Jogada.new(partida.jogadores[0], 10)
    #     jogadaAdicionalJogador0[0].lancarBola
    #     jogadaAdicionalJogador0[1] = Jogada.new(partida.jogadores[0], 10)
    #     jogadaAdicionalJogador0[1].lancarBola
    #     partida.placares[0].frames[i + 1] = Frame.new(jogadaAdicionalJogador0)

    #   end
    # end

  

    if (i == 9)
      totalJogador1 = 0
      totalJogador2 = 0
      for j in 0..9
        totalJogador1 = totalJogador1 + @@list[j][0][2]
        totalJogador2 = totalJogador2 + @@list[j][1][2]
      end
      @match.update(scoreP1: totalJogador1, scoreP2: totalJogador2)
      p 'kkkkkk'
    end

    # @@list[i][jogador]     0-jogada1 1-jogada2 2-score 3-status
    render json: @@list
    cookies[:i] = cookies[:i].to_i + 1

  end


  def atualizaPlacares(index, jogador, list)
    p index
    p jogador
    p list
    p list [2][0][3]
    if list[index][jogador][3] == 'spare'        
      list[index - 2][jogador][2] = list[index - 2][jogador][2] + list[index - 1][jogador][0]
    end
    if list[index - 2][jogador][3] == 'strike' && list[index - 1][jogador][3] != 'strike'
      list[index - 2][jogador][2] = list[index - 2][jogador][2] + list[index - 1][jogador][2]
    end
    if list[index - 2][jogador][3] == 'strike' && list[index - 1][jogador][3] == 'strike'
        list[index - 2][jogador][2] = list[index - 2][jogador][2] + list[index - 1][jogador][2] + list[index][jogador][0]
    end
    if index == 9
        if list[index - 1][jogador][3] == 'spare'
            list[index - 1][jogador][2] = list[index - 1][jogador][2] + list[index][jogador][0]
        end
        if list[index - 1][jogador][3] == 'strike' && !list[index][jogador][3] != 'strike'
            list[index - 1][jogador][2] = list[index - 1][jogador][2] + list[index][jogador][2]
        end
        if list[index - 1][jogador][3] == 'strike' && list[index][jogador][3] == 'strike'
          list[index - 1][jogador][2] = list[index - 1][jogador][2] + list[index][jogador][2] #+ list[index + 1][jogador][0]
        end
        if list[index - 1][jogador][3] == 'strike'
          list[index][jogador][2] = list[index][jogador][2] #+ list[index + 1][jogador][2]
        end
    end
    return list
  end

  def spareOrStrike(j1, j2)
    if j1 == 10
      return 'strike'
    end
    if (j1 + j2) == 10
      return 'spare'
    end
    return 'normal'
  end


end
