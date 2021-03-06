class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :profile
  has_many :requisitions


  def self.from_omniauth(data)
    where(provider: data[:provider], uid: data[:uid]).first_or_create do |user|
      user.email = data[:email]
      user.password = Devise.friendly_token[0, 20]
    end
  end

end
