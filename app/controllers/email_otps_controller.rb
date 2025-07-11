class EmailOtpsController < ApplicationController

  def confirm_otps
    @school_director = SchoolDirector.find_by(id: params[:id])
  end

  def check_otp
    @school_director = SchoolDirector.find_by(id: params[:school_director])
    otp = EmailOtp.find_by(pin:params[:pin])
    if otp.present?
      if otp.email == @school_director.email
        if otp.valid_until > Time.current
          @school_director.update(activated: true)
          redirect_to "/"
        else
          flash[:alert] = 'OTP has been expired'
        end
      else
          flash[:alert] = 'OTP does not match'
      end
    else
      #  flash[:alert] = 'OTP not found'
      redirect_to "/school_directors/#{@school_director.id}/confirm_otps", alert: "You have entered wrong OTP."
    end
  end 
    
  private
    
  def confirm_otps_params
    params.permit(:pin)
  end
end
