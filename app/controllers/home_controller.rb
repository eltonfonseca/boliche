class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, :set_match, :set_adversario
  
  def index
    
  end

  private 

  def set_match
    @match = Match.find(params[:match_id])
  end

  def set_adversario
    @adversario = Match.find(params[:match_id]).users.where(tipo_user: true)
  end

  def set_user
    @user = User.find(current_user)
  end
end
