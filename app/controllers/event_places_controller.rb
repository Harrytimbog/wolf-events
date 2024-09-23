class EventPlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_event_place, only: %i[show edit update destroy]

  def index
    @event_places = EventPlace.all.includes(:category) # Include categories to avoid N+1 query issues
  end

  def show
    @markers = [
      {
        lat: @event_place.latitude,
        lng: @event_place.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {event_place: @event_place})
      }
    ]
  end

  def new
    @event_place = EventPlace.new
  end

  def create
    @event_place = current_user.event_places.build(event_place_params)
    @event_place.user = current_user

    if @event_place.save
      redirect_to event_places_path, notice: "Event Place created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event_place.update(event_place_params)
      redirect_to event_places_path, notice: "Event Place updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @event_place.destroy
    redirect_to event_places_path, notice: "Event Place deleted successfully"
  end

  private

  def set_event_place
    @event_place = EventPlace.find(params[:id])
  end

  def event_place_params
    params.require(:event_place).permit(:name, :description, :location, :category_id, photos: [])
  end
end
