class RenameCallForPapersToCallForParticipation < ActiveRecord::Migration[4.2]
  def up
    rename_table :call_for_papers, :call_for_participations
  end

  def down
    rename_table :call_for_participations, :call_for_papers
  end
end
