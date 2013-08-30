class AddWorkflowStateToStageResult < ActiveRecord::Migration
  def change
    add_column :stage_results, :workflow_state, :string
  end
end
