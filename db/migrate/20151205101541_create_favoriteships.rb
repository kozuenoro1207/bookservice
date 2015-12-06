class CreateFavoriteships < ActiveRecord::Migration
  def change
    create_table :favoriteships do |t|
      t.references :user, index: true
      t.references :comment, index: true

      t.timestamps null: false
      t.index [:user_id, :comment_id], unique: true
    end
  end
end
