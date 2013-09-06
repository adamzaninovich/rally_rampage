class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login id
    cookies.signed[:team_id] = { value: id, expires: 2.days.from_now }
  end

  def current_team
    id = cookies.signed[:team_id]
    if id.present?
      Team.find id
    else
      nil
    end
  end
  helper_method :current_team

  def logout
    cookies.delete :team_id
  end
end
