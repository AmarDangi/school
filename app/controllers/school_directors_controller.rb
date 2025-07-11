class SchoolDirectorsController < ApplicationController
    before_action :find_school_director, only: [:show, :destroy, :update]
    def index
        @school_directors = SchoolDirector.where(activated:"true")
      
        # if @school_directors.present?
        #   render json: @school_directors , status: :ok
        # else
        #   render json: {data: []}, status: :ok
        # end
    end

    def new
      @school_director = SchoolDirector.new
    end
    
    # def create
    #   @school_director = SchoolDirector.new(school_director_params)
    #   if  @school_director.save
    #     render json: @school_director,status: :ok
    #    else
    #     render json: @school_director.errors.messages.to_json, status: :unprocessable_entity

    #   end
    # end

    def create
      @school_director = SchoolDirector.new(school_director_params)
      if @school_director.save
        EmailOtp.create(email: @school_director.email)
        UserMailer.with(user: @school_director.email).welcome_email.deliver_now
        redirect_to "/school_directors/#{@school_director.id}/confirm_otps"
    end
  end

  def edit
    @school_director = SchoolDirector.find(params[:id])
  end
    def show
        @school = @school_director.school
          # render json: @school_director,status: :ok
    end

    def update
      if @school_director.update(school_director_params)
        redirect_to "/"
          # render json: @school_director, status: :ok
      else
          # render json: @school_director.errors.full_messages, status: :unprocessable_entity
      end 
    end

    def destroy
      if @school_director.present?
        @school_director.destroy
        redirect_to "/"
        # render json: {message: "schoolDirector successfully destroy "}, status: :ok
      end
    end

      private 
      def school_director_params
          params.require(:school_director).permit(:id, :first_name, :last_name, :email, :mobile_no, :location, :about, :image)
      end
  
      def find_school_director
          @school_director = SchoolDirector.find_by(id: params[:id]) 
        
          render json: {message: "schoolDirector not found"} if @school_director.blank?
          
      end
end    
     
