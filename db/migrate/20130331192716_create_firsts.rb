class CreateFirsts < ActiveRecord::Migration
  def change
    create_table :firsts do |t|

      t.timestamps
    end
  end
end
