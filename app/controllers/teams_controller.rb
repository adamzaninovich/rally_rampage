class TeamsController < ApplicationController
  def index
    redirect_to current_team if current_team
    @teams = Team.all.order :name
  end

  def show
    @team = Team.find params[:id]
  end
end
