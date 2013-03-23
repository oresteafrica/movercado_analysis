class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.references :user
      t.references :app
      t.string :code
      t.integer :times_used, default: 0

      t.timestamps
    end
    add_index :codes, :user_id
    add_index :codes, :app_id
  end
end
