class Stage < ActiveRecord::Base
  has_many :stage_results
  has_many :teams, through: :stage_results

  TYPES = %w[ideal_time speed odometer]
  validates_inclusion_of :stage_type, in: Stage::TYPES

  # I spiked this to make sure that we
  # didn't need to add a 'finished'
  # column in the table, but we should
  # probably TDD this shit - Adam

  #def self.current
    #Stage.first
  #end

  def finished?
    if %w[ideal_time, speed].include? stage_type
      stage_results.any? && !stage_results.map(&:finish_time).include?(nil)
    else
      true
    end
  end
end
