class SchoolsController < ApplicationController
  before_action :find_school, only: [:show, :destroy, :update]

  def index
    @schools = School.all
    if @schools.present?
      # render json: schools , status: :ok
    else
    # render json: {data: []}, status: :ok
    end
  end

  def new
    @school_director = SchoolDirector.find_by(id: params[:school_director_id])
    @school = School.new
  end

  def edit
    @school = School.find_by(id: params[:id]) 
  end

  def create
      @school = School.new(school_params)
      @school.update(school_uniq_id: @school.school_name.split[0] + "#{rand(1..199)}")
      if @school.save
        redirect_to "/school_directors/#{@school.school_director.id}"
        # render json: @school,status: :ok
      else
        redirect_to "http://localhost:3000/school_directors/#{params[:school_director_id]}/schools/new"
        flash[:alert] = 'You have Already Created'
      #   render json: @school.errors.messages.to_json, status: :unprocessable_entity
    end
  end

  def show
    @school = School.find_by(id: params[:id])
      # render json: @school,status: :ok
  end

  def update
    if @school.update(school_params)
      # render json: {message: "School Successfully Updated"}, status: :ok
   else
      # render json: {message: "School not Update"}, status: :unprocessable_entity
   end 
  end

  def destroy
    if @school.present?
      @school.destroy
      redirect_to "/school_directors/#{@school.school_director.id}"
      # render json: {message: "school successfully destroy "}, status: :ok
    end
  end
  private 
    def school_params
      params.permit(:id, :school_uniq_id, :school_name, :approve_by_gov, :city, :school_director_id)
    end

    def find_school
      @school = School.find_by(id: params[:id]) 
     
      render json: {message: "school not found"}, status: :ok  if @school.blank?
      
   end

end
