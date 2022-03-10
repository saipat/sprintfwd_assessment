class AdForeignKeyProjectToMember < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :project_id, :integer
    remove_column :projects, :team_id
  end
end
