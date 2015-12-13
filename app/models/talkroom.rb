class Talkroom < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  has_many :favtalk_relationships, class_name: "Favtalkship", foreign_key: "talkroom_id", dependent: :destroy
  has_many :talkrooms, through: :favtalk_relationships, source: :user
  
  validates :user_id,  presence: true
  validates :talkname, presence: true
end