class API::V1::TeamsController < ApplicationController
  def index
    teams = Team.all.order :name
    render json: teams
  end

  def show
    team = Team.find params[:id]
    render json: team
  end
end
