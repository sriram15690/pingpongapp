class BookingsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def index
    #Getting all booking. Using Includes to reduce the number of Queries
    @bookings = Booking.includes(:user,:table).all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    respond_to do |format|
      if @booking.save!
        format.html { redirect_to bookings_path, notice: 'Booking was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:table_id, :start_time, :duration)
  end
end
