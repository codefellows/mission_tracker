class CreateCrews < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.string :name
      t.string :starship

      t.timestamps
    end
  end
end
