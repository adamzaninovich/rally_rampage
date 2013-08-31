class SessionsController < ApplicationController
  def create
    login params[:team_id]
    redirect_to current_stage_path
  end

  def destroy
    logout
    redirect_to root_path
  end
end
