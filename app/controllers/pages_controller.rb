class PagesController < ApplicationController
  def home
    @instruments = Instrument.all

    if params[:search] && params[:search][:query].present?
      @instruments = @instruments.where("name ILIKE :query", query: "%#{params[:search][:query]}%")
    end

    @markers = @instruments.joins(:owner).uniq.map do |instrument|
      {
        lat: instrument.owner.latitude,
        lng: instrument.owner.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {user: instrument.owner})
      }
    end
  end
end
