class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  validates :text, presence: true
end
