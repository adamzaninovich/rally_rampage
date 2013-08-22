class Challenge < ActiveRecord::Base
  has_many :team_challenges
  has_many :teams, :through => :team_challenges
end
