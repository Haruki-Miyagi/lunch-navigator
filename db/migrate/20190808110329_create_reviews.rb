class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, null: false
      t.string :gnavi_shop_id, null: false
      t.integer :score, null: false
      t.string :comment, null: false

      t.timestamps
    end
    add_index :reviews, :gnavi_shop_id
    add_index :reviews, [:user_id, :gnavi_shop_id], unique: true, name: 'compound_uniqueness'
  end
end
