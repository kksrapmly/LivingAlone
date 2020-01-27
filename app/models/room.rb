class Room < ApplicationRecord


  belongs_to :to_messages, class_name: "User", foreign_key: :to_id
  belongs_to :from_messages, class_name: "User", foreign_key: :from_id

  has_many :talks, dependent: :destroy

  # to_id、from_idが同じ組み合わせで保存されない
  validates_uniqueness_of :to_id, scope: :from_id

  scope :between, -> (to_id, from_id) do
    where("(rooms.to_id = ? AND rooms.from_id = ?) OR (rooms.to_id = ? AND rooms.from_id =?)", to_id, from_id, from_id, to_id)
  end

  def target_user(current_user)
    if to_id == current_user.id
      User.find(from_id)
    elsif from_id == current_user.id
      User.find(to_id)
    end
  end


end