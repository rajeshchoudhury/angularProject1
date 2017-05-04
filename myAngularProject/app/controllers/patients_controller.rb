class PatientsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @patients = if params[:keywords]
        Patient.where('UPPER(name) like UPPER(?)',"%#{params[:keywords]}%")
    else
        Patient.all
    end
  end

  def show
  	@patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(params.require(:patient).permit(:name,:address,:birth,:phone,:birthplace,:civilstate,:skin,:special_patient,:email,:sex,:obs))
    @patient.save
    render 'show', status: 201
  end

  def update
    patient = Patient.find(params[:id])
    patient.update_attributes(params.require(:patient).permit(:name,:address,:birth,:phone,:birthplace,:civilstate,:skin,:special_patient,:email,:sex,:obs))
    head :no_content
  end

  def destroy
    patient = Patient.find(params[:id])
    patient.destroy
    head :no_content
  end
end