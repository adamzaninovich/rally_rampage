require 'spec_helper'

describe Stage do
  let!(:result) { StageResult.create stage: stage, team: Team.create }
  let!(:stage) { Stage.create stage_type: 'speed' }
  subject { stage }

  describe '#finished?' do
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

end
