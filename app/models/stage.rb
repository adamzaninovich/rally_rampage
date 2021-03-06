class Stage < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  has_many :stage_results
  has_many :teams, through: :stage_results

  TYPES = %w[ideal_time speed odometer]
  validates_inclusion_of :stage_type, in: Stage::TYPES

  def self.current
    Stage.order(:order_number).reject(&:finished?).first
  end

  def ordered_results
    stage_results.sort_by(&:result)
  end

  def finished?
    stage_results.any? && !stage_results.map(&:finished?).include?(false)
  end

  def to_json_for_team team
    data = {}
    data[:stage_type]  = stage_type
    data[:start_time]  = (start_time_for_team(team).to_f*1000).to_i
    data[:end_time]    = (ideal_end_time_for_team(team).to_f*1000).to_i if ideal_time?
    data[:finish_time] = (finish_time_for_team(team).to_f*1000).to_i
    data.to_json
  end

  def start_time_for_team team
    results_for_team(team).start_time
  end

  def finish_time_for_team team
    results_for_team(team).finish_time
  end

  def ideal_end_time_for_team team
    if ideal_time? && !results_for_team(team).not_started?
      start_time_for_team(team) + ideal_time
    else
      0
    end
  end

  def results_for_team team
    stage_results.where(team: team).first
  end

  def ideal_time?
    stage_type == 'ideal_time'
  end

  def speed?
    stage_type == 'speed'
  end

  def odometer?
    stage_type == 'odometer'
  end

end
