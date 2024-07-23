# app/controllers/otp_verifications_controller.rb
class OtpVerificationsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    if @user.verify_otp(params[:otp_code])
      check_and_activate_user(@user)
      redirect_to root_path, notice: 'Phone number verified successfully'
    else
      flash[:alert] = 'Invalid or expired OTP'
      render :new
    end
  end

  private

  def check_and_activate_user(user)
    if user.confirmed? && user.otp_verified?
      user.update(active: true)
    end
  end
end
