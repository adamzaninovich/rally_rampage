require 'spec_helper'

describe Stage do

  describe '.current' do
    let!(:stages) do
      team = Team.create
      %w[ideal_time odometer].each_with_index.map do |stage_type, i|
        stage = Stage.create! stage_type: stage_type, order_number: i+1
        StageResult.create! stage: stage, team: team
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

  describe '#finished?' do
    let(:result) { StageResult.create! stage: stage, team: Team.create! }
    let(:stage) { Stage.create! stage_type: 'speed' }
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

  describe '#to_json_for_team' do
    it "returns the correct json when stage is ideal_time" do
      start_time = Time.now
      team = Team.create!
      stage = Stage.create! stage_type: 'ideal_time', ideal_time: 1.hour
      result = StageResult.create! stage: stage, team: team
      result.start!
      result.update_attributes! start_time: start_time
      stage.to_json_for_team(team).should == {
        stage_type: 'ideal_time',
        start_time: (start_time.to_f*1000).to_i,
        end_time: ((start_time + 1.hour).to_f*1000).to_i,
        finish_time: 0
      }.to_json
    end
  end

  describe '#start_time_for_team' do
    it "returns the correct start time" do
      start_time = Time.now
      team = Team.create!
      stage = Stage.create! stage_type: 'speed'
      StageResult.create! team: team, stage: stage, start_time: start_time
      stage.start_time_for_team(team).to_i.should == start_time.to_i
    end
  end

  describe '#finish_time_for_team' do
    it "returns the correct finish time" do
      finish_time = 1.minute.ago
      team = Team.create!
      stage = Stage.create! stage_type: 'speed'
      StageResult.create! team: team, stage: stage, finish_time: finish_time
      stage.finish_time_for_team(team).to_i.should == finish_time.to_i
    end
  end

  describe '#ideal_end_time_for_team' do
    it "returns 0 when the stage is not ideal_time" do
      start_time = Time.now
      team = Team.create!
      stage = Stage.create! stage_type: 'speed'
      result = StageResult.create! stage: stage, team: team
      result.start!
      result.update_attributes! start_time: start_time
      stage.ideal_end_time_for_team(team).should == 0
    end

    it "returns the correct end_time when the stage is ideal_time" do
      start_time = Time.now
      team = Team.create!
      stage = Stage.create! stage_type: 'ideal_time', ideal_time: 1.hour
      result = StageResult.create! stage: stage, team: team
      result.start!
      result.update_attributes! start_time: start_time
      stage.ideal_end_time_for_team(team).to_i.should == start_time.to_i + 1.hour
    end
  end

  describe '#results_for_team' do
    it "finds the correct result set" do
      team = Team.create!
      stage = Stage.create! stage_type: 'speed'
      results = StageResult.create! team: team, stage: stage
      stage.results_for_team(team).should == results
    end
  end

  describe '#ordered_results' do
    let(:time) { Time.now }
    let(:team1) { Team.create }
    let(:team2) { Team.create }
    let(:team3) { Team.create }
    let(:stage) { Stage.create stage_type: 'speed' }
    let(:result1) { StageResult.create stage: stage, team: team1 }
    let(:result2) { StageResult.create stage: stage, team: team2 }
    let(:result3) { StageResult.create stage: stage, team: team3 }
    it 'correctly orders the teams' do
      [result1, result2, result3].each do |r|
        r.start!
        r.finish!
        r.start_time = time
      end
      result1.finish_time = time + 2.minutes
      result2.finish_time = time + 3.minutes
      result3.finish_time = time + 1.minute
      [result1, result2, result3].each(&:save!)
      stage.ordered_results.should == [result3, result1, result2]
    end
  end

  describe "stage type predicates" do
    let(:ideal_time_stage)  { Stage.new stage_type: 'ideal_time' }
    let(:speed_stage)       { Stage.new stage_type: 'speed' }
    let(:odometer_stage)    { Stage.new stage_type: 'odometer' }
    describe '#ideal_time?' do
      it "is true when it is an ideal time stage" do
        ideal_time_stage.should be_ideal_time
      end
      it "is false when it is a speed stage" do
        speed_stage.should_not be_ideal_time
      end
      it "is false when it is a odometer stage" do
        odometer_stage.should_not be_ideal_time
      end
    end

    describe '#speed?' do
      it "is true when it is a speed stage" do
        speed_stage.should be_speed
      end
      it "is false when it is an ideal time stage" do
        ideal_time_stage.should_not be_speed
      end
      it "is false when it is a odometer stage" do
        odometer_stage.should_not be_speed
      end
    end

    describe 'odometer?' do
      it "is true when it is a odometer stage" do
        odometer_stage.should be_odometer
      end
      it "is false when it is an ideal time stage" do
        ideal_time_stage.should_not be_odometer
      end
      it "is false when it is a speed stage" do
        speed_stage.should_not be_odometer
      end
    end
  end

end
