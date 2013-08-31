class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  # POST /stages/:stage_id/done
  def done
    @stage = Stage.find params[:stage_id]
  end

  # GET /stages/current
  def current
    @stage = Stage.current
    if @stage
      render :show
    else
      redirect_to results_path # todo: needs a results model and controller, no AR needed probably
    end
  end
end
