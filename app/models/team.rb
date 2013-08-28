class Team < ActiveRecord::Base
  has_many :stage_results
  has_many :stages, through: :stage_results
end
