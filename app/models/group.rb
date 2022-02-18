class Group < ApplicationRecord
  has_many :user_group_relations, dependent: :destroy
  has_many :users, through: :user_group_relations

  after_save :create_user_group_relation

  def self.search(search)
    return Group.order("updated_at DESC").limit(20) unless search
    Group.where('name LIKE(?)', "%#{search}%")
  end

  private
  def create_user_group_relation
    self.users << User.current
  end
end
