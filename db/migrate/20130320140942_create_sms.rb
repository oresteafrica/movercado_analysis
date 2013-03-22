class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.string :body
      t.integer :sender_phone_id
      t.integer :recipient_phone_id
      t.datetime :sent_at
      t.references :app

      t.timestamps
    end
    add_index :sms, :app_id
  end
end
