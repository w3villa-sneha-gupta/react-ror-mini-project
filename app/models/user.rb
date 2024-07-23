class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  def verify_otp(entered_otp)
    return false if otp_code != entered_otp
    return false if otp_expires_at < Time.current
      
    update(otp_verified: true, otp_code: nil, otp_expires_at: nil)
  end
end
