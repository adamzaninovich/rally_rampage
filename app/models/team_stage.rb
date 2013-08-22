class TeamStage < ActiveRecord::Base
  belongs_to :team
  belongs_to :stage
end
