class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_group_relations, dependent: :destroy
  has_many :groups, through: :user_group_relations

  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end

  def in_this_group?(group)
    resp = UserGroupRelation.find_by(user_id: self.id, group_id: group.id)
    if resp
      return true
    else
      return false
    end
  end

  def same_group?(user)
    group_ids1 = self.groups.map{|g| g.id}
    group_ids2 = user.groups.map{|g| g.id}
    if (group_ids1 & group_ids2).nil?
      return true
    else
      return false
    end
  end
end
