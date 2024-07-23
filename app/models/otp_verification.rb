class OtpVerification < ApplicationRecord
  belongs_to :user
  before_create :generate_otp

  def generate_otp
    otp = ROTP::TOTP.new(ENV['OTP_SECRET'])
    self.otp_code = otp.now
    self.expires_at = 10.minutes.from_now
  end

  def verify_otp(entered_otp)
    return false unless otp_code == entered_otp
    return false if expires_at < Time.current

    update(verified: true)
  end
end
