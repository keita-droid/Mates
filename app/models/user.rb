class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  has_one_attached :image
  has_many :user_group_relations, dependent: :destroy
  has_many :groups, through: :user_group_relations
  has_many :posts, dependent: :destroy

  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end

  def self.search(search)
    return User.order("updated_at DESC").limit(20) unless search
    User.where('account_name LIKE(?)', "%#{search}%")
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
    unless (group_ids1 & group_ids2).empty?
      return true
    else
      return false
    end
  end
  
  def same_groups(user)
    group_ids1 = self.groups.map{|g| g.id}
    group_ids2 = user.groups.map{|g| g.id}
    ids = group_ids1 & group_ids2
    Group.where(id: ids)
  end

  def public_groups
    self.groups.where(public: true)
  end

  def private_groups
    self.groups.where(public: false)
  end

  def taken_posts
    self.posts.order("updated_at DESC").take(3)
  end
end
