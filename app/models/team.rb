class Team < ActiveRecord::Base
  has_many :stage_results
  has_many :stages, through: :stage_results

  # While the Stage#ordered_results method will return the ordered
  # results for a particular stage, the Team.ordered_by_results
  # method will return teams ordered by the results of all completed
  # stages up to this point.
  def self.ordered_by_results
    #current_stage = Stage.current
    all
  end
end
