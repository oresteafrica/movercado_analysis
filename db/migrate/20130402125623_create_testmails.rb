class CreateTestmails < ActiveRecord::Migration
  def change
    create_table :testmails do |t|

      t.timestamps
    end
  end
end
