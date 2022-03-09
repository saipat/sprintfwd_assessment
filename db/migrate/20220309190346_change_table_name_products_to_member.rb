class ChangeTableNameProductsToMember < ActiveRecord::Migration[7.0]
  def change
    rename_table :products, :members
  end
end
