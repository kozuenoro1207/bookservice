class Talkroom < ActiveRecord::Base
  belongs_to :user
  validates :talkname, presence: true
end
