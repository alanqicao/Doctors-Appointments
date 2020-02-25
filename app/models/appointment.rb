class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  def new
    @users = User.all - @doctor.users
    @appointment = @doctor.appointments.new
  end

end
