require 'spec_helper'

describe Stage do

  describe '#finished?' do
    let(:result) { StageResult.create stage: stage, team: Team.create }
    let(:stage) { Stage.create stage_type: 'speed' }
    subject { stage }

    context "when all stage_results are finished" do
      before { result.start! and result.finish! }
      it { should be_finished }
    end
    context "when some stage_results are finished" do
      before do
        StageResult.create(stage: stage, team: Team.create).start!
        result.start! and result.finish!
      end
      it { should_not be_finished }
    end
    context "when no stage_results are finished" do
      before { result.start! }
      it { should_not be_finished }
    end
  end

  describe '.current' do
    let!(:stages) do
      team = Team.create
      %w[ideal_time odometer].each_with_index.map do |stage_type, i|
        stage = Stage.create stage_type: stage_type, order_number: i+1
        StageResult.create stage: stage, team: team
        stage
      end
    end
    context "when no stages have been started" do
      it "returns the first stage" do
        Stage.current.order_number.should == 1
      end
    end
    context "when the first stage is finished and the second has not been started" do
      it "returns the second stage" do
        stage = stages.first
        stage.stage_results.first.start!
        stage.stage_results.first.finish!
        Stage.current.order_number.should == 2
      end
    end
    context "when both stages are finished" do
      it "returns nil" do
        stages.each do |stage|
          stage.stage_results.first.start!
          stage.stage_results.first.finish!
        end
        Stage.current.should be_nil
      end
    end
  end

end
