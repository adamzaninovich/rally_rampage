class StagesController < ApplicationController
  # GET /stages
  def index
    @stages = Stage.all
  end

  # POST /stages/:stage_id/start
  def start
    @stage = Stage.find params[:stage_id]
    result = @stage.results_for_team current_team
    result.start!
  end

  # GET /stages/current
  def current
    if current_team
      @stage = Stage.current
      if @stage
        render :show
      else
        redirect_to results_path # todo: needs a results model and controller, no AR needed probably
      end
    else
      redirect_to teams_path
    end
  end
end
