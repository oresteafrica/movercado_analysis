class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :type
      t.string :code

      t.timestamps
    end
  end
end
