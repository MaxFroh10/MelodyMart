class PagesController < ApplicationController
  def home
    @instruments = Instrument.all

    @markers = User.joins(:instruments).geocoded.uniq.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {user: user})
      }
    end
  end
end
