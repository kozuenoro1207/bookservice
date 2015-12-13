class Favtalkship < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :talkroom, class_name: "Talkroom"
end
