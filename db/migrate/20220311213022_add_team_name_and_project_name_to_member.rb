class AddTeamNameAndProjectNameToMember < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :team_name, :string
    add_column :members, :project_name, :string
  end
end
