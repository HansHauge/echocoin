class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.float  :balance
      t.string :btc_address
      t.float  :lifetime_contributions
      t.string :name

      t.timestamps null: false
    end
  end
end
