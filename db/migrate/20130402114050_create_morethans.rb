class CreateMorethans < ActiveRecord::Migration
  def change
    create_table :morethans do |t|

      t.timestamps
    end
  end
end
