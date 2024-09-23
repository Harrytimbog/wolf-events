class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @event_places = EventPlace.all.includes(:category)

    # The `geocoded` scope filters only event places with coordinates
    @markers = @event_places.geocoded.map do |event_place|
      {
        lat: event_place.latitude,
        lng: event_place.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {event_place: event_place})
      }
    end
  end
end
