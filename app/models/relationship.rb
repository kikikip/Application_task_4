class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  #　フォローしたときの処理
  def follow(user_id)
    Relationship.create(follower_id: id, followed_id: user_id)
  end

  #　フォローを外すときの処理
  def unfollow(user_id)
    Relationship.find_by(follower_id: id, followed_id: user_id).destroy
  end

  #フォローしていればtrueを返す
  def following?(user)
    following_users.include?(user)
  end
end
