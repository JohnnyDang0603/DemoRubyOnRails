class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friends, dependent: :destroy
  has_one_attached :avatar
  after_commit :add_default_avatar, only: %i[create update]
  def admin?
    has_role?(:admin)
  end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '150x150').processed
    else
      '/default_profile.jpg'
    end
  end

  private
  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_profile.jpg'
          )
        ),filename: 'default_profile.jpg',
        content_type: 'image/jpg'
      )
    end
  end

end
