class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    puts current_user.inspect
    @reservation.user = current_user
    
    if @reservation.save
      redirect_to rooms_path
    else
      render :new
    end
  end
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :room_id)
  end
end
