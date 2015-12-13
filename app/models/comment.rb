class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :talkroom
  
  has_many :favoriteships, class_name: "Favoriteship",foreign_key: "comment_id", dependent: :destroy
  has_many :users , through: :favoriteships, source: :user
  
  validates :user_id, presence: true
  validates :talkroom_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
end
