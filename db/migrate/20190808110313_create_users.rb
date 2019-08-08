class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :account, null: false

      t.timestamps
    end
    add_index :users, :account, unique: true
  end
end
