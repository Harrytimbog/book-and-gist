class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook] #  REMEMBER %i[facebook github  twitter google] etc

  def self.from_omniauth(auth)
    name_split = auth.info.name.split(" ")
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, email: auth.info.email, username: name_split[0], password: Devise.friendly_token[0, 20])
      user
  end

  has_many :gist_sessions, foreign_key: "host_id", dependent: :destroy
  has_one_attached :photo
  validates :username, presence: true, uniqueness: true
end
