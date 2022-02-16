class Group < ApplicationRecord
  has_many :user_group_relations, dependent: :destroy
  has_many :users, through: :user_group_relations

  after_save :create_user_group_relation

  private
  def create_user_group_relation
    self.users << User.current
  end
end
