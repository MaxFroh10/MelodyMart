class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show edit update destroy]

  # GET /instruments
  def index
    @instruments = Instrument.all
  end

  # GET /instruments/:id
  def show
  end

  # GET /instruments/new
  def new
    @instrument = Instrument.new
  end

  # POST /instruments
  def create
    @instrument = Instrument.new(instrument_params)

    if @instrument.save
      redirect_to @instrument, notice: "Instrument was successfully created."
    else
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
    @instrument.destroy
    redirect_to instruments_path, notice: "Instrument was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def instrument_params
    params.require(:instrument).permit(:category, :name, :description, :price, :picture)
  end
end
