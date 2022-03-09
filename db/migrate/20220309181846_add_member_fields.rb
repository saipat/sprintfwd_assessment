class AddMemberFields < ActiveRecord::Migration[7.0]
  def change
  create_table :products do |t|
    t.string :first_name, null: false
    t.string :last_name, null: false
    t.string :city
    t.string :state
    t.string :country
    
    t.timestamps
  end
  end
end
