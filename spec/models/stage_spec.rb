require 'spec_helper'

describe Stage do
  describe '#finished?' do
    #context "when stage_type is ideal_time" do
      #let(:stage) { Stage.create order_number: 1, stage_type: 'ideal_time', ideal_time: 1.hour }
      #subject { stage }
      #context "when all stage_results have a finish_time" do
        #before { StageResult.create stage: stage, team: Team.create, finish_time: 1.minute.ago }
        #it { should be_finished }
      #end
      #context "when some stage_results have a finish time" do
        #before do
          #StageResult.create stage: stage, team: Team.create, finish_time: 1.minute.ago
          #StageResult.create stage: stage, team: Team.create
        #end
        #it { should_not be_finished }
      #end
      #context "when no stage_results have a finish time" do
        #it { should_not be_finished }
      #end
    #end

    #context "when stage_type is speed" do
      #let(:stage) { Stage.new order_number: 1, stage_type: 'speed', pax_percent: 50.0 }
      #subject { stage }
      #context "when all stage_results have a finish_time" do
        #before { StageResult.create stage: stage, team: Team.create, finish_time: 1.minute.ago }
        #it { should be_finished }
      #end
      #context "when some stage_results have a finish time" do
        #before do
          #StageResult.create stage: stage, team: Team.create, finish_time: 1.minute.ago
          #StageResult.create stage: stage, team: Team.create
        #end
        #it { should_not be_finished }
      #end
      #context "when no stage_results have a finish time" do
        #it { should_not be_finished }
      #end
    #end

    #context "when stage_type is odometer" do
      #let(:stage) { Stage.new order_number: 1, stage_type: 'odometer' }
      #subject { stage }
      #context "when all stage_results have a finish_odometer" do
        #before { StageResult.create stage: stage, team: Team.create, finish_odometer: 1.minute.ago }
        #it { should be_finished }
      #end
      #context "when some stage_results have a finish_odometer" do
        #before do
          #StageResult.create stage: stage, team: Team.create, finish_odometer: 1.minute.ago
          #StageResult.create stage: stage, team: Team.create
        #end
        #it { should_not be_finished }
      #end
      #context "when no stage_results have a finish_odometer" do
        #it { should_not be_finished }
      #end
    #end
  end
end
