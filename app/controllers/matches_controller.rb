class MatchesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_match, only: :destroy

  # GET /matches
  # GET /matches.json
  def index
    @matches = current_user.matches.distinct
  end

  def new
    @match = Match.new
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)
    @match.users << current_user
    respond_to do |format|
      if @match.save
        format.html { redirect_to matches_path, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
      respond_to do |format|
      format.html { redirect_to matches_path, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
      end
  end

  def match_params
    params.require(:match).permit(:name, :difficulty)
  end

  def set_match
    @match = Match.find(params[:id])
  end
end