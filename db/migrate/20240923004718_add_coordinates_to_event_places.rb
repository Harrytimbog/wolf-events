class AddCoordinatesToEventPlaces < ActiveRecord::Migration[7.1]
  def change
    add_column :event_places, :latitude, :float
    add_column :event_places, :longitude, :float
  end
end
