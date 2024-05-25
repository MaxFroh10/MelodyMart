class BookingsController < ApplicationController
  require_relative '../models/booking.rb'
  require_relative '../models/instrument.rb'

  def index
    @bookings = Booking.where(renter: current_user)
  end

  def new
    @booking = Booking.new
    @instrument = Instrument.find(params[:instrument_id])
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    @booking.renter = current_user
    if @booking.save
      redirect_to instrument_booking_path(@instrument, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def instrument_params
    params.require(:instrument).permit(:instrument_id)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :instrument_id)
  end

end
