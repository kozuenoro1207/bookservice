class Talkroom < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates :user_id,  presence: true
  validates :talkname, presence: true
  def talkroom_comments
    Comment.where(talkroom_id: [self.id])
  end
end
