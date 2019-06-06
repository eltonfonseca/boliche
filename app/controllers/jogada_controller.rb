class JogadaController < ApplicationController
  def new
    @match = Match.find(params[:match_id])
    render json: @match.users
  end
end
