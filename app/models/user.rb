require 'open-uri'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable
  
  has_one_attached :image
  has_many :user_group_relations, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :groups, through: :user_group_relations
  has_many :requested_groups, through: :requests, source: :group
  has_many :posts, dependent: :destroy

  validates :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20] # ランダムなパスワードを作成
      image_url = auth.info.image if user.provider == "facebook"
      user.download_and_attach_avatar(image_url)
    end
  end

  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲストユーザー'
      user.status = '体験版'
    end
  end

  def self.search(search)
    return [] unless search
    return [] if search == ""
    if search == "それ誤診です"
      User.order("created_at ASC").limit(50)
    else
      User.where('name LIKE(?)', "%#{search}%")
    end
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
    unless (self.groups & user.groups).empty?
      return true
    else
      return false
    end
  end
  
  def same_groups(user)
    self.groups & user.groups
  end

  def public_groups
    self.groups.where(public: true)
  end

  def private_groups
    self.groups.where(public: false)
  end

  def taken_posts
    self.posts.order("updated_at DESC").take(4)
  end

  def requested?(group)
    request = self.requests.find_by(group_id: group.id)
    unless request.nil?
      return true
    else
      return false
    end
  end

  def invited?(group)
    invite = Invite.find_by(user_id: self.id, group_id: group.id)
    unless invite.nil?
      return true
    else
      return false
    end
  end

  def download_and_attach_avatar(image_url)
    return unless image_url
    file = open(image_url)
    image.attach(io: file,
                  filename: "profile_image.#{file.content_type_parse.first.split("/").last}",
                  content_type: file.content_type_parse.first)  
  end
end
