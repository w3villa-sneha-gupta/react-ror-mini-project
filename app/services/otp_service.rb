# app/services/otp_service.rb
# app/services/otp_service.rb
require 'securerandom'

class OtpService
  OTP_LENGTH = 6
  OTP_EXPIRATION = 10.minutes

  def self.send_otp(user)
    otp_code = generate_otp
    user.update(otp_code: otp_code, otp_expires_at: OTP_EXPIRATION.from_now)
    send_sms(user.phone_number, otp_code)
  end

  private

  def self.generate_otp
    SecureRandom.hex(OTP_LENGTH / 2) # Generating a 6-character hex OTP
  end

  def self.send_sms(to, otp_code)
    TWILIO_CLIENT.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: to,
      body: "Your OTP code is #{otp_code}"
    )
  end
end

  