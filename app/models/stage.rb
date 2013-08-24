class Stage < ActiveRecord::Base
  has_many :team_stages
  has_many :teams, :through => :team_stages

  def current
    
  end
end
