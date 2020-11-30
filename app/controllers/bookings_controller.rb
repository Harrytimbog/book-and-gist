class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_date: params[:booking_date])
    @gist_session = GistSession.find(params[:gist_session_id])
    @booking.gist_session = @gist_session
    @booking.guest = current_user
    if @booking.save
      flash[:notice] = "Gist session successfully booked!"
      redirect_to user_path(current_user)
    else
      render :gist_session
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:alert] = "Booking deleted"
    redirect_to user_path(current_user)
  end
end
