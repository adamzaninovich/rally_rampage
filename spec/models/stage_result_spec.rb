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
    it "saves the start odometer when the stage is odometer" do
      stage.update_attributes stage_type: 'odometer'
      result.start! 11223
      result.start_odometer.should == 11223
    end

    it "saves the start time when the stage is timed" do
      stage.update_attributes stage_type: 'ideal_time'
      result.start!
      result.start_time.should be_within(1.second).of Time.now
    end
  end

  describe '#finish' do
    it "saves the finish odometer when the stage is odometer" do
      stage.update_attributes stage_type: 'odometer'
      result.start! 11223
      result.finish! 11224
      result.finish_odometer.should == 11224
    end

    it "saves the finish time when the stage is timed" do
      stage.update_attributes stage_type: 'speed'
      result.start!
      result.finish!
      result.finish_time.should be_within(1.second).of Time.now
    end
  end

  describe '#result' do
    let(:time) { Time.now }
    context 'when stage is speed' do
      before { stage.update_attributes stage_type: 'speed' }
      it "returns the elapsed time" do
        result.start!
        result.finish!
        result.start_time = time
        result.finish_time = time + 1.minute
        result.result.should == 60.0
      end
    end
    context "when the stage is ideal time" do
      before do
        stage.update_attributes stage_type: 'ideal_time', ideal_time: 1.minute
        result.start!
        result.finish!
        result.start_time = time
      end
      it "returns the distance from ideal time" do
        result.finish_time = time + 1.minute + 5.seconds
        result.result.should == 5.0
      end
      it "returns the distance from ideal time in positive value" do
        result.finish_time = time + 1.minute - 5.seconds
        result.result.should == 5.0
      end
    end
    context "when the stage is odometer" do
      pending
    end
  end

end
