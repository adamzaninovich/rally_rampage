class TeamChallenge < ActiveRecord::Base
  belongs_to :team
  belongs_to :challenge
end
