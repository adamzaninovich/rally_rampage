require 'spec_helper'

describe Team do
  describe '.ordered_by_results' do
    # stage1      stage2      results
    # team1 15    team2 15    team2 25
    # team2 10    team3 10    team1 20
    # team3  5    team1  5    team3 15

    let(:time) { Time.now }
    let(:team1) { Team.create }
    let(:team2) { Team.create }
    let(:team3) { Team.create }
    let(:stage1) { Stage.create stage_type: 'speed' }
    let(:stage2) { Stage.create stage_type: 'speed' }
    before do
      s1t1, s1t2, s1t3, s2t1, s2t2, s2t3 = [stage1, stage2].map do |stage|
        [team1, team2, team3].map do |team|
          result = StageResult.create stage: stage, team: team
          result.start!
          result.finish!
          result.update_attributes finish_time: time
          result
        end
      end.flatten
      # stage 1
      s1t1.update_attributes start_time: 1.minute.ago
      s1t2.update_attributes start_time: 2.minute.ago
      s1t3.update_attributes start_time: 3.minute.ago
      # stage 2
      s2t1.update_attributes start_time: 3.minute.ago
      s2t2.update_attributes start_time: 1.minute.ago
      s2t3.update_attributes start_time: 2.minute.ago
    end
    it 'correctly orders the teams' do
      Team.ordered_by_results.should == [team2, team1, team3]
    end
  end

end
