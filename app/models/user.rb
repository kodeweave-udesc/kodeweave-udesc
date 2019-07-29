class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_and_belongs_to_many :projects
  has_many :tasks

  validates :cpf, uniqueness: { case_sensitive: false }

  def image
    avatar.present? ? avatar : 'default-user3.png'
  end

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)

    if user.present?
      user.update!(
        provider: auth.provider,
        uid: auth.uid,
        token: auth.credentials.token,
        expires: auth.credentials.expires,
        expires_at: auth.credentials.expires_at,
        refresh_token: auth.credentials.refresh_token,
        name: auth.info.name,
        avatar: auth.info.image
      )

      return user
    end

    user = User.create!(
      provider: auth.provider,
      uid: auth.uid,
      token: auth.credentials.token,
      expires: auth.credentials.expires,
      expires_at: auth.credentials.expires_at,
      refresh_token: auth.credentials.refresh_token,
      email: auth.info.email,
      cpf: auth.info.email,
      name: auth.info.name,
      avatar: auth.info.image,
      password:  SecureRandom.hex(40)
    )
  end
end
