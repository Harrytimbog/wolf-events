class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :event_place
end
