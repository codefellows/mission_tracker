class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.string :objective
      t.references :crew_id
      t.references :captain_id

      t.timestamps
    end
    add_index :missions, :crew_id_id
    add_index :missions, :captain_id_id
  end
end
