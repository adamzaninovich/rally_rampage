class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def current
    @stage = Stage.current
  end
end
