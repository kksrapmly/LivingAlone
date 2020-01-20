class Relationship < ApplicationRecord

  
  belongs_to :followed, class_name: "User"
  belongs_to :follower, class_name: "User"

  enum status: { "いいね": 0, "ごめんなさい": 1}

  validates :followed_id, presence: true
  validates :follower_id, presence: true


end