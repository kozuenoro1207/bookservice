class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
        
    has_many :comments
    has_many :talkrooms
    
    has_many :following_relationships, class_name:  "Relationship",
                                     foreign_key: "follower_id",
                                     dependent:   :destroy
    has_many :following_users, through: :following_relationships, source: :followed
    has_many :follower_relationships, class_name:  "Relationship",
                                    foreign_key: "followed_id",
                                    dependent:   :destroy
    has_many :follower_users, through: :follower_relationships, source: :follower

    has_many :favcom_relationships, class_name: "Favoriteship", foreign_key: "user_id", dependent: :destroy
    has_many :fav_comments, through: :favcom_relationships, source: :comment
    
    has_many :favtalk_relationships, class_name: "Favtalkship", foreign_key: "user_id", dependent: :destroy
    has_many :fav_talkrooms, through: :favtalk_relationships, source: :talkroom
    
    
    def follow(other_user)
        following_relationships.find_or_create_by(followed_id: other_user.id)
    end

    def unfollow(other_user)
        following_relationship = following_relationships.find_by(followed_id: other_user.id)
        following_relationship.destroy if following_relationship
    end

    def following?(other_user)
        following_users.include?(other_user)
    end
    
    def feed_items
        #Talkroom.where(user_id: following_user_ids + [self.id])
        Talkroom.all
    end
    
    def favorite_com(comment)
      favcom_relationships.find_or_create_by(comment_id: comment.id) 
    end
    
    def unfavorite_com(comment)
      favcom_relationship = favcom_relationships.find_by(comment_id: comment.id)
      favcom_relationship.destroy if favcom_relationship
    end
    def favoriting_com?(comment)
      fav_comments.include?(comment)
    end
    
    def favorite_talk(talkroom)
      favtalk_relationships.find_or_create_by(talkroom_id: talkroom.id) 
    end
    
    def unfavorite_talk(talkroom)
      favtalk_relationship = favtalk_relationships.find_by(talkroom_id: talkroom.id)
      favtalk_relationship.destroy if favtalk_relationship
    end

    def favoriting_talk?(talkroom)
      fav_talkrooms.include?(talkroom)
    end
    
end
