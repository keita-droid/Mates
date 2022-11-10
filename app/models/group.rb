class Group < ApplicationRecord
  has_many :user_group_relations, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :users, through: :user_group_relations

  after_create :create_user_group_relation

  validates :name, presence: true

  def self.search(search)
    return Group.where(public: true).order("updated_at DESC").limit(20) unless search
    Group.where('public = true AND name LIKE(?)', "%#{search}%")
  end

  def relation(user)
    UserGroupRelation.find_by(group_id: self.id, user_id: user.id)
  end

  def request(user)
    Request.find_by(group_id: self.id, user_id: user.id)
  end

  private
  def create_user_group_relation
    self.users << User.current
  end
end
