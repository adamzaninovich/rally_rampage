class Team < ActiveRecord::Base
  has_many :team_stages
  has_many :stages, :through => :team_stages
end
