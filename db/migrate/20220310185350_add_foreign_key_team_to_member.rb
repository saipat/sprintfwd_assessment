class AddForeignKeyTeamToMember < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :team_id, :integer
  end
end
