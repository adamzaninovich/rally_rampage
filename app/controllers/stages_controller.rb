class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def current
    @stage = Stage.first
  end
end
