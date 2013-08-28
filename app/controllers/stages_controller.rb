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
    render :show
  end
end
