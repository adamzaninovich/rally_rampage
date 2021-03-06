class StageResult < ActiveRecord::Base
  include Workflow

  belongs_to :team
  belongs_to :stage

  workflow do
    state :not_started do
      event :start, transitions_to: :in_progress
    end

    state :in_progress do
      event :finish, transitions_to: :finished
    end

    state :finished
  end

  def start odometer=nil
    if odometer.present?
      update_attributes! start_odometer: odometer
    else
      update_attributes! start_time: Time.now
    end
  end

  def finish odometer=nil
    if odometer.present?
      update_attributes! finish_odometer: odometer
    else
      update_attributes! finish_time: Time.now
    end
  end

  def result
    if stage.stage_type == 'ideal_time'
      (finish_time - start_time - stage.ideal_time).abs
    else
      finish_time - start_time
    end
  end
end
