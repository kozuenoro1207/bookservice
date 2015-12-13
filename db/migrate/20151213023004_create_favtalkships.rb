class CreateFavtalkships < ActiveRecord::Migration
  def change
    create_table :favtalkships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :talkroom, index: true, foreign_key: true
      t.timestamps null: false
      t.index [:user_id, :talkroom_id], unique: true
    end
  end
end
