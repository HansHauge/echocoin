class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.float  :balance
      t.string :btc_address
      t.string :btc_passwd_digest
      t.string :name

      t.timestamps null: false
    end
  end
end
