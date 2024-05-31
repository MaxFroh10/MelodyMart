class BookingsController < ApplicationController
  require_relative '../models/booking'
  require_relative '../models/instrument'
  before_action :set_instrument, only: %i[new create show]
  before_action :set_booking, only: %i[show approve deny]

  def index
    @bookings = Booking.for_owner(current_user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    @booking.renter = current_user
    @booking.status = 'pending'

    if @booking.save
      redirect_to owner_instruments_path(@instrument, @booking), notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    @bookings = Booking.not_owned_by_renter
  end

  def approve
    change_status('accepted')
  end

  def deny
    change_status('declined')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end

  def instrument_params
    params.require(:instrument).permit(:instrument_id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  # Set appropriate status for booking
  def change_status(action)
    if @booking.update(status: action)
      redirect_to all_rentings_path, notice: "Booking #{action} successfully."
    else
      # @booking.errors.full_messages
      redirect_to all_rentings_path, alert: "Booking #{action} faulty."
    end
  end

  def booking_params
    params.require(:booking).permit(:booking_id, :start_date, :end_date, :instrument_id, :renter_id, :status)
  end
end
