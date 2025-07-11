class TeachersController < ApplicationController

  before_action :find_teacher, only: [:show, :destroy, :update]
 
    def index
        @teachers = Teacher.all
        if @teachers.present?
         #   render json: @teachers , status: :ok
        else
         #   render json: {data: []}, status: :ok
        end
    end

   def create
      @teacher = Teacher.new(teacher_params)
      @teacher.school_id = params[:school_id]
      if @teacher.save
         redirect_to "/school_directors/#{@teacher.school.school_director.id}"
         # render json: @teacher,status: :ok
      else
         # render json: @teacher.errors.messages.to_json, status: :unprocessable_entity
      end
   end

   def new
      @school = School.find_by(id: params[:id])
      @teacher = Teacher.new
   end

   def show
    #   @teacher = Teacher.find_by(id: params[:id])
      render json: @teacher,status: :ok
   end

   def update
      if @teacher.update(teacher_params)
         # render json: {message: "teacher Successfully Updated"}, status: :ok
     else
         # render json: {message: "Teacher not Update"}, status: :unprocessable_entity
      end 
   end

   def destroy
      if  @teacher.present?
          @teacher.destroy
         #  render json: {message: "teacher successfully destroy "}, status: :ok
      end
   end

   private 

   def teacher_params
      params.fetch(:teacher).permit(:id, :first_name, :last_name, :age, :email, :uniq_id, :experience, :mobile_no, :about, :school_id)
   end

   def find_teacher
     @teacher = Teacher.find_by(id: params[:id]) 
     render json: {message: "teacher not found"}, status: :ok  if @teacher.blank?
  end


end
