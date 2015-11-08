class CreatePrizePools < ActiveRecord::Migration
  def change
    create_table :prize_pools do |t|
      t.string  :btc_address
      t.string  :name
      t.integer :payout_frequency

      t.timestamps null: false
    end
  end
end
