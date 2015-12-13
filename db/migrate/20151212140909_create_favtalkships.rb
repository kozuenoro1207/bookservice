class CreateFavtalkships < ActiveRecord::Migration
  def change
    create_table :favtalkships do |t|
      t.references :user_id, index: true
      t.references :talkroom_id, index: true

      t.timestamps null: false
      t.index [:user_id, :talkroom_id], unique: true
    end
  end
end
