class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.string :objective
      t.references :captain
      t.references :crew

      t.timestamps
    end
    add_index :missions, :captain_id
    add_index :missions, :crew_id
  end
end
