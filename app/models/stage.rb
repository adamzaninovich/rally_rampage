class Stage < ActiveRecord::Base
  has_many :stage_results
  has_many :teams, through: :stage_results

  TYPES = %w[ideal_time speed odometer]
  validates_inclusion_of :stage_type, in: Stage::TYPES

  def self.current
    Stage.order(:order_number).reject(&:finished?).first
  end

  def finished?
    stage_results.any? && !stage_results.map(&:finished?).include?(false)
  end
end
