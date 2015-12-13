class Favtalkship < ActiveRecord::Base
  belongs_to :user
  belongs_to :talkroom
end
