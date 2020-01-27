class Talk < ApplicationRecord


  belongs_to :room
  belongs_to :user

  validates_presence_of :conversation, :room_id, :user_id

  def talk_time
    created_at.strftime("%Y/%m/%d %H:%M:%S")
  end


end