class Stage < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

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

  def render_ideal_time
    render_time ideal_time
  end

  private
  def render_time seconds
    hours = seconds / 3600
    seconds -= hours * 3600

    minutes = seconds / 60
    seconds -= minutes * 60

    time = []
    time << pluralize(hours, 'hour')
    time << pluralize(minutes, 'minute')
    time << pluralize(seconds, 'second') if seconds < 0
    time.join ", "
  end
end
