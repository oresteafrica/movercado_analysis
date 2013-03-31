class CreateToptens < ActiveRecord::Migration
  def change
    create_table :toptens do |t|
      t.string :sessions
      t.string :firstlast

      t.timestamps
    end
  end
end
