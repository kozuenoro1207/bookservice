class CreateTalkrooms < ActiveRecord::Migration
  def change
    create_table :talkrooms do |t|
      t.references :user, index: true, foreign_key: true
      t.text :talkname

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
