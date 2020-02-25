class AppointmentsController < ApplicationController
  before_action :set_doctor
  def index
    @monday = @doctor.appointments.where(date: 'monday')
    @tuesday = @doctor.appointments.where(date: 'tuesday')
    @wednesday = @doctor.appointments.where(date: 'wednesday')
    @thursday = @doctor.appointments.where(date: 'thursday')
    @friday = @doctor.appointments.where(date: 'friday')
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

 private
   def set_doctor
     @doctor = doctor.find(params[:doctor_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(:date, :user_id)
   end
end