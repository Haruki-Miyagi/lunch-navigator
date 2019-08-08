class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.references :user, foreign_key: true, null: false
      t.string :gnavi_shop_id, null: false

      t.timestamps
    end
    add_index :stars, :gnavi_shop_id
    add_index :stars, [:user_id, :gnavi_shop_id], unique: true, name: 'compound_uniqueness'
  end
end
