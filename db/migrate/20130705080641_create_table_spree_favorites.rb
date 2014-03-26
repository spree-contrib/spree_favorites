class CreateTableSpreeFavorites < ActiveRecord::Migration
  def change
    create_table :spree_favorites do |t|
      t.belongs_to :favorable, polymorphic: true
      t.belongs_to :user
      t.string :user_token
      t.timestamps
    end
    add_index :spree_favorites, [:favorable_id, :favorable_type]
    add_index :spree_favorites, :user_id
    add_index :spree_favorites, :user_token
  end
end
