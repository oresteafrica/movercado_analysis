class CreateMovmails < ActiveRecord::Migration
  def change
    create_table :movmails do |t|

      t.timestamps
    end
  end
end
