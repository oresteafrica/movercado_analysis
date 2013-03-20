class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :name
      t.references :user
      t.references :app

      t.timestamps
    end
    add_index :interactions, :user_id
    add_index :interactions, :app_id
  end
end
