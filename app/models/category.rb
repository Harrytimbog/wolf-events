class Category < ApplicationRecord
  has_many :event_place, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
