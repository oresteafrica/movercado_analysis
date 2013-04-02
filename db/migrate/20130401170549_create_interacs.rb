class CreateInteracs < ActiveRecord::Migration
  def change
    create_table :interacs do |t|

      t.timestamps
    end
  end
end
