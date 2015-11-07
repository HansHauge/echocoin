class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :recipient
      t.string :sender
      t.float  :total

      t.references :charity

      t.timestamps null: false
    end
  end
end
