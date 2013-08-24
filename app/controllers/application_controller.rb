class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login id
    session[:team_id] = id
  end

  def current_team
    id = session[:team_id]
    if id.present?
      Team.find id
    else
      nil
    end
  end

  def logout
    session[:team_id] = nil
  end
end
