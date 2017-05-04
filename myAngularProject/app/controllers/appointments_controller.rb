class AppointmentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @appointments = Appointment.all.each { |m| m.obs = m.patient.name }
  end

  def find_by_patient
    @appointments = Appointment.where(patient_id: params[:patient_id])
  end

  def events_for_calendar
    @appointments = Appointment.all
  end

  def show
  	@appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(params.require(:appointment).permit(:visit_type,:obs,:date,:time,:duration,:patient_id))
    @appointment.save
    render 'show', status: 201
  end

  def update
    appointment = Appointment.find(params[:id])
    appointment.update_attributes(params.require(:appointment).permit(:visit_type,:obs,:date,:time,:duration,:patient_id))
    head :no_content
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    head :no_content
  end
end
