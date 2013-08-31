require 'spec_helper'

describe StageResult do
  let(:stage) { Stage.new }
  let(:result) { StageResult.create stage: stage, team: Team.create }
  subject { result }

  describe "the state machine aspect" do
    context "when the stage is new" do
      it { should be_not_started }
    end

    context "when the stage result has been started" do
      before { result.start! }
      it { should be_in_progress }
    end

    context "when the stage results is finished" do
      before do
        result.start!
        result.finish!
      end
      it { should be_finished }
    end
  end

  describe '#start' do
    context "when the stage is odometer" do
      before { stage.update_attributes stage_type: 'odometer' }
      it "saves the start odometer" do
        subject.start! 11223
        subject.start_odometer.should == 11223
      end
    end
    context "when the stage is timed" do
      before { stage.update_attributes stage_type: 'ideal_time' }
      it "saves the start time" do
        subject.start!
        subject.start_time.should be_within(1.second).of Time.now
      end
    end
  end

  describe '#finish' do
    context "when the stage is odometer" do
      before do
        stage.update_attributes stage_type: 'odometer'
        subject.start! 11223
      end
      it "saves the finish odometer" do
        subject.finish! 11224
        subject.finish_odometer.should == 11224
      end
    end
  end
end
