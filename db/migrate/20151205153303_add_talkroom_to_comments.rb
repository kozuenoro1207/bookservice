class AddTalkroomToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :talkroom, index: true, foreign_key: true
  end
end
