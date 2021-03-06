class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_many :houses, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :talks, dependent: :destroy


  attachment :user_image

  enum which: { "借りる": 0, "貸したい": 1 }
  enum sex: { "男": 0, "女": 1 }
  # 都道府県を選択できる
  enum prefecture: {
    お住まいの都道府県を選択して下さい:0,
    北海道:1, 青森県:2, 岩手県:3, 宮城県:4, 秋田県:5, 山形県:6, 福島県:7, 茨城県:8,
    栃木県:9, 群馬県:10, 埼玉県:11, 千葉県:12, 東京都:13, 神奈川県:14, 新潟県:15, 富山県:16,
    石川県:17, 福井県:18, 山梨県:19, 長野県:20, 岐阜県:21, 静岡県:22, 愛知県:23, 三重県:24,
    滋賀県:25, 京都府:26, 大阪府:27, 兵庫県:28, 奈良県:29, 和歌山県:30, 鳥取県:31, 島根県:32,
    岡山県:33, 広島県:34, 山口県:35, 徳島県:36, 香川県:37, 愛媛県:38, 高知県:39,
    福岡県:40, 佐賀県:41, 長崎県:42, 熊本県:43, 大分県:44, 宮崎県:45, 鹿児島県:46, 沖縄県:47
  }

  validates :name, presence: true
  validates :introduction, presence: true
  validates :which, presence: true
  validates :sex, presence: true
  validates :prefecture, presence: true

  # フォローしているか確認
  def following?(other_user)
    following.include?(other_user)
  end

  # フォローされているか確認
  def followers?(other_user)
    followers.include?(other_user)
  end

  # マッチングしているか確認
  def matching?(other_user)
    matching.include?(other_user)
  end

  # フォローする
  def follow(other_user)
    following << other_user
  end

  # アンフォローする
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # マッチング
  def matching
    following & followers
  end


end