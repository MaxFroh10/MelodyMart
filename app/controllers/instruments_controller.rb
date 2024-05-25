class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /instruments
  def index
    @instruments = Instrument.all
  end

  # GET /instruments/:id
  def show
  end

  # GET /instruments/:id
  def owner
    @instruments = Instrument.by_owner(current_user)
    @bookings = Booking.where(renter: current_user)
  end

  # GET /instruments/new
  def new
    @instrument = Instrument.new
  end

  # POST /instruments
  def create
    @instrument = Instrument.new(instrument_params)

    # Add current user as owner of the instrument
    @instrument.owner = current_user

    if @instrument.save
      redirect_to @instrument, notice: "Instrument was successfully created."
    else
      puts @instrument.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  # GET /instruments/:id
  def edit
  end

  # PATCH /instruments/:id/edit
  def update
    if @instrument.update(instrument_params)
      redirect_to @instrument, notice: "Instrument was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /instruments/:id
  def destroy
    # Only the owner of the instrument can delete it
    if @instrument.owner == current_user
      @instrument.destroy
      redirect_to instruments_path, notice: "Instrument was successfully destroyed."
    else
      redirect_to instruments_path, notice: "You can't delete an instrument that you don't own."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def instrument_params
    params.require(:instrument).permit(:category, :name, :description, :price, :picture, :owner)
  end
end
