class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  enum role: %i[reader writer admin]
  has_one_attached :avatar
  after_create :attach_default_avatar

  private

  def attach_default_avatar
    return if avatar.attached?

    avatar.attach(
      io: File.open(
        Rails.root.join(
          'app', 'assets', 'images', 'default-avatar.png'
        )
      ), filename: 'default-avatar.png',
      content_type: 'image/png'
    )
  end
end
